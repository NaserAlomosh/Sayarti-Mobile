import 'dart:async';
import 'dart:ui';

import 'package:sayarti_mobile/presentation/core/widgets/toast/another_flushbar_custom_widget.dart';
import 'package:flutter/material.dart';

class FlushbarRoute<T> extends OverlayRoute<T> {
  FlushbarRoute({
    required this.flushbar,
    super.settings,
  })  : _builder = Builder(
          builder: (context) {
            return GestureDetector(
              onTap: flushbar.onTap == null
                  ? null
                  : () => flushbar.onTap?.call(flushbar),
              child: flushbar,
            );
          },
        ),
        _onStatusChanged = flushbar.onStatusChanged {
    _configureAlignment(flushbar.flushbarPosition);
  }

  final AnotherFlushbarCustomWidget<T> flushbar;
  final Builder _builder;

  final Completer<T?> _transitionCompleter = Completer<T?>();
  final FlushbarStatusCallback? _onStatusChanged;

  Animation<double>? _filterBlurAnimation;
  Animation<Color?>? _filterColorAnimation;
  Animation<Alignment>? _animation;
  AnimationController? _controller;

  Alignment? _initialAlignment;
  Alignment? _endAlignment;

  bool _wasDismissedBySwipe = false;

  Timer? _timer;
  T? _result;

  FlushbarStatus? currentStatus;

  String dismissibleKeyGen = '';

  Future<T?> get completed => _transitionCompleter.future;

  bool get opaque => false;

  Animation<Alignment>? get animation => _animation;

  @protected
  AnimationController? get controller => _controller;

  String get debugLabel => '$runtimeType';

  void _configureAlignment(FlushbarPosition position) {
    switch (position) {
      case FlushbarPosition.top:
        _initialAlignment = const Alignment(-1, -2);
        _endAlignment = flushbar.endOffset == null
            ? const Alignment(-1, -1)
            : const Alignment(-1, -1) +
                Alignment(
                  flushbar.endOffset!.dx,
                  flushbar.endOffset!.dy,
                );

      case FlushbarPosition.bottom:
        _initialAlignment = const Alignment(-1, 2);
        _endAlignment = flushbar.endOffset == null
            ? const Alignment(-1, 1)
            : const Alignment(-1, 1) +
                Alignment(
                  flushbar.endOffset!.dx,
                  flushbar.endOffset!.dy,
                );
    }
  }

  @override
  Future<RoutePopDisposition> willPop() {
    return Future.value(
      flushbar.isDismissible
          ? RoutePopDisposition.pop
          : RoutePopDisposition.doNotPop,
    );
  }

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    final entries = <OverlayEntry>[];

    if (flushbar.blockBackgroundInteraction) {
      entries.add(
        OverlayEntry(
          opaque: opaque,
          builder: (context) {
            return Listener(
              onPointerDown: flushbar.isDismissible
                  ? (_) => _dismiss()
                  : null,
              child: _createBackgroundOverlay(),
            );
          },
        ),
      );
    }

    entries.add(
      OverlayEntry(
        opaque: opaque,
        builder: (context) {
          return Semantics(
            focused: false,
            container: true,
            explicitChildNodes: true,
            child: AlignTransition(
              alignment: _animation!,
              child: flushbar.isDismissible
                  ? _getDismissibleFlushbar()
                  : _getFlushbar(),
            ),
          );
        },
      ),
    );

    return entries;
  }

  Widget _createBackgroundOverlay() {
    if (_filterBlurAnimation != null &&
        _filterColorAnimation != null) {
      return AnimatedBuilder(
        animation: Listenable.merge([
          _filterBlurAnimation,
          _filterColorAnimation,
        ]),
        builder: (context, child) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: _filterBlurAnimation!.value,
              sigmaY: _filterBlurAnimation!.value,
            ),
            child: ColoredBox(
              color:
                  _filterColorAnimation!.value ?? Colors.transparent,
              child: const SizedBox.expand(),
            ),
          );
        },
      );
    }

    if (_filterBlurAnimation != null) {
      return AnimatedBuilder(
        animation: _filterBlurAnimation!,
        builder: (context, child) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: _filterBlurAnimation!.value,
              sigmaY: _filterBlurAnimation!.value,
            ),
            child: const SizedBox.expand(),
          );
        },
      );
    }

    if (_filterColorAnimation != null) {
      return AnimatedBuilder(
        animation: _filterColorAnimation!,
        builder: (context, child) {
          return ColoredBox(
            color:
                _filterColorAnimation!.value ?? Colors.transparent,
            child: const SizedBox.expand(),
          );
        },
      );
    }

    return const SizedBox.expand();
  }

  Widget _getDismissibleFlushbar() {
    return Dismissible(
      key: ValueKey(dismissibleKeyGen),
      direction: _getDismissDirection(),
      resizeDuration: null,
      confirmDismiss: (_) {
        final isTransitioning =
            currentStatus == FlushbarStatus.isAppearing ||
            currentStatus == FlushbarStatus.isHiding;

        return Future.value(!isTransitioning);
      },
      onDismissed: (_) {
        dismissibleKeyGen += '1';
        _wasDismissedBySwipe = true;
        _dismiss();
      },
      child: _getFlushbar(),
    );
  }

  DismissDirection _getDismissDirection() {
    if (flushbar.dismissDirection ==
        FlushbarDismissDirection.horizontal) {
      return DismissDirection.horizontal;
    }

    return flushbar.flushbarPosition == FlushbarPosition.top
        ? DismissDirection.up
        : DismissDirection.down;
  }

  Widget _getFlushbar() {
    return Container(
      margin: flushbar.margin,
      child: _builder,
    );
  }

  void _dismiss([T? result]) {
    _cancelTimer();

    if (isCurrent) {
      navigator?.pop<T>(result);
      return;
    }

    if (isActive) {
      navigator?.removeRoute(this);
    }
  }

  @override
  bool get finishedWhenPopped {
    return _controller?.status == AnimationStatus.dismissed;
  }

  AnimationController createAnimationController() {
    assert(
      !_transitionCompleter.isCompleted,
      'Cannot reuse a $runtimeType after disposing it.',
    );

    return AnimationController(
      duration: flushbar.animationDuration,
      debugLabel: debugLabel,
      vsync: navigator!,
    );
  }

  Animation<Alignment> createAnimation() {
    return AlignmentTween(
      begin: _initialAlignment,
      end: _endAlignment,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: flushbar.forwardAnimationCurve,
        reverseCurve: flushbar.reverseAnimationCurve,
      ),
    );
  }

  Animation<double>? createBlurFilterAnimation() {
    final routeBlur = flushbar.routeBlur;

    if (routeBlur == null) {
      return null;
    }

    return Tween<double>(
      begin: 0,
      end: routeBlur,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(
          0,
          0.35,
          curve: Curves.easeInOutCirc,
        ),
      ),
    );
  }

  Animation<Color?>? createColorFilterAnimation() {
    final routeColor = flushbar.routeColor;

    if (routeColor == null) {
      return null;
    }

    return ColorTween(
      begin: Colors.transparent,
      end: routeColor,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(
          0,
          0.35,
          curve: Curves.easeInOutCirc,
        ),
      ),
    );
  }

  void _handleStatusChanged(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        currentStatus = FlushbarStatus.showing;
        _onStatusChanged?.call(currentStatus);

        if (overlayEntries.isNotEmpty) {
          overlayEntries.first.opaque = opaque;
        }

      case AnimationStatus.forward:
        currentStatus = FlushbarStatus.isAppearing;
        _onStatusChanged?.call(currentStatus);

      case AnimationStatus.reverse:
        currentStatus = FlushbarStatus.isHiding;
        _onStatusChanged?.call(currentStatus);

        if (overlayEntries.isNotEmpty) {
          overlayEntries.first.opaque = false;
        }

      case AnimationStatus.dismissed:
        currentStatus = FlushbarStatus.dismissed;
        _onStatusChanged?.call(currentStatus);

        if (!isCurrent) {
          navigator?.finalizeRoute(this);

          if (overlayEntries.isNotEmpty) {
            overlayEntries.clear();
          }
        }
    }

    changedInternalState();
  }

  @override
  void install() {
    assert(
      !_transitionCompleter.isCompleted,
      'Cannot install a $runtimeType after disposing it.',
    );

    _controller = createAnimationController();
    _filterBlurAnimation = createBlurFilterAnimation();
    _filterColorAnimation = createColorFilterAnimation();
    _animation = createAnimation();

    super.install();
  }

  @override
  TickerFuture didPush() {
    _animation?.addStatusListener(_handleStatusChanged);

    _configureTimer();
    unawaited(super.didPush());

    return _controller!.forward();
  }

  @override
  void didReplace(Route<dynamic>? oldRoute) {
    if (oldRoute is FlushbarRoute<dynamic>) {
      _controller?.value = oldRoute._controller?.value ?? 0;
    }

    _animation?.addStatusListener(_handleStatusChanged);

    super.didReplace(oldRoute);
  }

  @override
  bool didPop(T? result) {
    _result = result;
    _cancelTimer();

    if (_wasDismissedBySwipe) {
      Timer(
        const Duration(milliseconds: 200),
        () => _controller?.reset(),
      );

      _wasDismissedBySwipe = false;
    } else {
      unawaited(_controller?.reverse());
    }

    return super.didPop(result);
  }

  void _configureTimer() {
    _cancelTimer();

    final duration = flushbar.duration;

    if (duration == null) {
      return;
    }

    _timer = Timer(
      duration,
      _dismiss,
    );
  }

  void _cancelTimer() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }

    _timer = null;
  }

  bool canTransitionTo(FlushbarRoute<dynamic> nextRoute) {
    return true;
  }

  bool canTransitionFrom(
    FlushbarRoute<dynamic> previousRoute,
  ) {
    return true;
  }

  @override
  void dispose() {
    assert(
      !_transitionCompleter.isCompleted,
      'Cannot dispose a $runtimeType twice.',
    );

    _cancelTimer();

    _animation?.removeStatusListener(_handleStatusChanged);
    _controller?.dispose();

    _transitionCompleter.complete(_result);

    super.dispose();
  }

  @override
  String toString() {
    return '$runtimeType(animation: $_controller)';
  }
}

FlushbarRoute<T> showFlushbar<T>({
  required BuildContext context,
  required AnotherFlushbarCustomWidget<T> flushbar,
}) {
  return FlushbarRoute<T>(
    flushbar: flushbar,
    settings: const RouteSettings(
      name: flushbarRouteName,
    ),
  );
}