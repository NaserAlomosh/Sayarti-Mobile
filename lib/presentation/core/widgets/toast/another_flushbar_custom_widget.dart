import 'dart:async';
import 'dart:ui';

import 'package:sayarti_mobile/presentation/core/widgets/toast/another_flushbar_custom_route.dart'
    as route;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const String flushbarRouteName = '/flushbarRoute';

typedef FlushbarStatusCallback = void Function(FlushbarStatus? status);
typedef FlushbarTapCallback<T> = void Function(
  AnotherFlushbarCustomWidget<T> flushbar,
);

class AnotherFlushbarCustomWidget<T> extends StatefulWidget {
  const AnotherFlushbarCustomWidget({
    super.key,
    this.title,
    this.titleColor,
    this.titleSize,
    this.message,
    this.messageSize,
    this.messageColor,
    this.titleText,
    this.messageText,
    this.icon,
    this.shouldIconPulse = true,
    this.maxWidth,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius,
    this.textDirection = TextDirection.ltr,
    this.borderColor,
    this.borderWidth = 1,
    this.backgroundColor = const Color(0xFF303030),
    this.leftBarIndicatorColor,
    this.boxShadows,
    this.backgroundGradient,
    this.mainButton,
    this.onTap,
    this.duration,
    this.isDismissible = true,
    this.dismissDirection = FlushbarDismissDirection.vertical,
    this.showProgressIndicator = false,
    this.progressIndicatorController,
    this.progressIndicatorBackgroundColor,
    this.progressIndicatorValueColor,
    this.flushbarPosition = FlushbarPosition.bottom,
    this.positionOffset = 0,
    this.flushbarStyle = FlushbarStyle.floating,
    this.forwardAnimationCurve = Curves.easeOutCirc,
    this.reverseAnimationCurve = Curves.easeOutCirc,
    this.animationDuration = const Duration(seconds: 1),
    this.onStatusChanged,
    this.barBlur = 0,
    this.blockBackgroundInteraction = false,
    this.routeBlur,
    this.routeColor,
    this.userInputForm,
    this.endOffset,
  });

  final FlushbarStatusCallback? onStatusChanged;

  final String? title;
  final double? titleSize;
  final Color? titleColor;

  final String? message;
  final double? messageSize;
  final Color? messageColor;

  final Widget? titleText;
  final Widget? messageText;

  final Color backgroundColor;
  final Color? leftBarIndicatorColor;
  final List<BoxShadow>? boxShadows;
  final Gradient? backgroundGradient;

  final Widget? icon;
  final bool shouldIconPulse;

  final Widget? mainButton;
  final FlushbarTapCallback<T>? onTap;

  final Duration? duration;
  final bool isDismissible;

  final double? maxWidth;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BorderRadius? borderRadius;
  final TextDirection textDirection;

  final Color? borderColor;
  final double borderWidth;

  final FlushbarPosition flushbarPosition;
  final double positionOffset;
  final FlushbarDismissDirection dismissDirection;
  final FlushbarStyle flushbarStyle;

  final Curve forwardAnimationCurve;
  final Curve reverseAnimationCurve;
  final Duration animationDuration;

  final double barBlur;
  final bool blockBackgroundInteraction;
  final double? routeBlur;
  final Color? routeColor;

  final bool showProgressIndicator;
  final AnimationController? progressIndicatorController;
  final Color? progressIndicatorBackgroundColor;
  final Animation<Color>? progressIndicatorValueColor;

  final Form? userInputForm;
  final Offset? endOffset;

 Future<T?> show(BuildContext context) {
  final flushbarRoute = route.showFlushbar<T>(
    context: context,
    flushbar: this,
  ) as Route<T>;

  return Navigator.of(
    context,
  ).push<T>(flushbarRoute);
}

  @override
  State<AnotherFlushbarCustomWidget<T>> createState() =>
      _AnotherFlushbarCustomWidgetState<T>();
}

class _AnotherFlushbarCustomWidgetState<T>
    extends State<AnotherFlushbarCustomWidget<T>>
    with TickerProviderStateMixin {
  static const Duration _pulseDuration = Duration(seconds: 1);

  final GlobalKey _backgroundKey = GlobalKey();
  final Completer<Size> _sizeCompleter = Completer<Size>();

  AnimationController? _pulseController;
  Animation<double>? _pulseAnimation;
  CurvedAnimation? _progressAnimation;

  late final FocusScopeNode _focusNode;
  late final FocusAttachment _focusAttachment;

  bool get _hasTitle =>
      widget.titleText != null || (widget.title?.isNotEmpty ?? false);

  double get _messageTopPadding =>
      _hasTitle ? 6 : widget.padding.top;

  @override
  void initState() {
    super.initState();

    assert(
      widget.userInputForm != null ||
          widget.messageText != null ||
          (widget.message?.isNotEmpty ?? false),
      'A message is required when userInputForm is not provided.',
    );

    _focusNode = FocusScopeNode();
    _focusAttachment = _focusNode.attach(context);

    _configureSizeMeasurement();
    _configureProgressAnimation();
    _configurePulseAnimation();
  }

  @override
  void dispose() {
    _pulseController?.dispose();

    // The controller is supplied externally, so this widget should not dispose it.
    _progressAnimation?.dispose();

    _focusAttachment.detach();
    _focusNode.dispose();

    super.dispose();
  }

  void _configureSizeMeasurement() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _sizeCompleter.isCompleted) {
        return;
      }

      final renderObject =
          _backgroundKey.currentContext?.findRenderObject();

      if (renderObject is RenderBox && renderObject.hasSize) {
        _sizeCompleter.complete(renderObject.size);
      }
    });
  }

  void _configureProgressAnimation() {
    final controller = widget.progressIndicatorController;

    if (widget.showProgressIndicator && controller != null) {
      _progressAnimation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      );
    }
  }

  void _configurePulseAnimation() {
    if (widget.icon == null || !widget.shouldIconPulse) {
      return;
    }

    _pulseController = AnimationController(
      vsync: this,
      duration: _pulseDuration,
    );

    _pulseAnimation = Tween<double>(
      begin: 1,
      end: 0.4,
    ).animate(
      CurvedAnimation(
        parent: _pulseController!,
        curve: Curves.linear,
      ),
    );

    _pulseController!.addStatusListener(_onPulseStatusChanged);
    unawaited(_pulseController!.forward());
  }

  void _onPulseStatusChanged(AnimationStatus status) {
    final controller = _pulseController;

    if (controller == null) {
      return;
    }

    switch (status) {
      case AnimationStatus.completed:
        unawaited(controller.reverse());

      case AnimationStatus.dismissed:
        unawaited(controller.forward());

      case AnimationStatus.forward:
      case AnimationStatus.reverse:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: 1,
      child: Material(
        color: widget.flushbarStyle == FlushbarStyle.floating
            ? Colors.transparent
            : widget.backgroundColor,
        child: SafeArea(
          minimum: _safeAreaInsets(context),
          top: widget.flushbarPosition == FlushbarPosition.top,
          bottom: widget.flushbarPosition == FlushbarPosition.bottom,
          left: false,
          right: false,
          child: _buildFlushbar(),
        ),
      ),
    );
  }

  EdgeInsets _safeAreaInsets(BuildContext context) {
    final viewInsets = MediaQuery.viewInsetsOf(context);

    return switch (widget.flushbarPosition) {
      FlushbarPosition.top => EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top +
              widget.positionOffset,
        ),
      FlushbarPosition.bottom => EdgeInsets.only(
          bottom: viewInsets.bottom + widget.positionOffset,
        ),
    };
  }

  Widget _buildFlushbar() {
    final content = widget.userInputForm != null
        ? _buildInputContent()
        : _buildNotificationContent();

    if (widget.barBlur <= 0) {
      return content;
    }

    return Stack(
      children: [
        FutureBuilder<Size>(
          future: _sizeCompleter.future,
          builder: (context, snapshot) {
            final size = snapshot.data;

            if (size == null) {
              return const SizedBox.shrink();
            }

            return ClipRRect(
              borderRadius: widget.borderRadius ?? BorderRadius.zero,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: widget.barBlur,
                  sigmaY: widget.barBlur,
                ),
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                ),
              ),
            );
          },
        ),
        content,
      ],
    );
  }

  Widget _buildInputContent() {
    return Container(
      key: _backgroundKey,
      constraints: _constraints,
      decoration: _decoration,
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      child: FocusScope(
        node: _focusNode,
        autofocus: true,
        child: widget.userInputForm!,
      ),
    );
  }

  Widget _buildNotificationContent() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap == null
          ? null
          : () => widget.onTap?.call(widget),
      child: Container(
        key: _backgroundKey,
        constraints: _constraints,
        decoration: _decoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildProgressIndicator(),
            Row(
              children: [
                _buildLeftBarIndicator(),
                if (widget.icon != null) _buildIconSection(),
                Expanded(
                  child: _buildTextSection(),
                ),
                if (widget.mainButton != null) _buildMainButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxConstraints? get _constraints {
    final maxWidth = widget.maxWidth;

    return maxWidth == null
        ? null
        : BoxConstraints(maxWidth: maxWidth);
  }

  BoxDecoration get _decoration {
    return BoxDecoration(
      color: widget.backgroundGradient == null
          ? widget.backgroundColor
          : null,
      gradient: widget.backgroundGradient,
      boxShadow: widget.boxShadows,
      borderRadius: widget.borderRadius,
      border: widget.borderColor == null
          ? null
          : Border.all(
              color: widget.borderColor!,
              width: widget.borderWidth,
            ),
    );
  }

  Widget _buildProgressIndicator() {
    if (!widget.showProgressIndicator) {
      return const SizedBox.shrink();
    }

    final animation = _progressAnimation;

    if (animation == null) {
      return LinearProgressIndicator(
        backgroundColor: widget.progressIndicatorBackgroundColor,
        valueColor: widget.progressIndicatorValueColor,
      );
    }

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: animation.value,
          backgroundColor: widget.progressIndicatorBackgroundColor,
          valueColor: widget.progressIndicatorValueColor,
        );
      },
    );
  }

  Widget _buildTextSection() {
    final horizontalStart = widget.icon == null
        ? widget.padding.left
        : 4.0;

    final horizontalEnd = widget.mainButton == null
        ? widget.padding.right
        : 8.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_hasTitle)
          Padding(
            padding: EdgeInsets.only(
              top: widget.padding.top,
              left: horizontalStart,
              right: horizontalEnd,
            ),
            child: _buildTitle(),
          ),
        Padding(
          padding: EdgeInsets.only(
            top: _messageTopPadding,
            left: horizontalStart,
            right: horizontalEnd,
            bottom: widget.padding.bottom,
          ),
          child: _buildMessage(),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return widget.titleText ??
        Text(
          widget.title ?? '',
          style: TextStyle(
            fontSize: widget.titleSize ?? 16,
            color: widget.titleColor ?? Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
  }

  Widget _buildMessage() {
    return widget.messageText ??
        Text(
          widget.message ?? '',
          style: TextStyle(
            fontSize: widget.messageSize ?? 14,
            color: widget.messageColor ?? Colors.white,
          ),
        );
  }

  Widget _buildIconSection() {
    final icon = widget.icon!;

    final displayedIcon =
        icon is Icon && widget.shouldIconPulse && _pulseAnimation != null
            ? FadeTransition(
                opacity: _pulseAnimation!,
                child: icon,
              )
            : icon;

    final leftPadding =
        widget.padding.left > 16 ? widget.padding.left : 0.0;

    return SizedBox(
      width: 42 + leftPadding,
      child: Center(
        child: displayedIcon,
      ),
    );
  }

  Widget _buildMainButton() {
    final rightPadding =
        (widget.padding.right - 12).clamp(4.0, double.infinity);

    return Padding(
      padding: EdgeInsets.only(right: rightPadding),
      child: widget.mainButton,
    );
  }

  Widget _buildLeftBarIndicator() {
    final color = widget.leftBarIndicatorColor;

    if (color == null) {
      return const SizedBox.shrink();
    }

    return FutureBuilder<Size>(
      future: _sizeCompleter.future,
      builder: (context, snapshot) {
        final size = snapshot.data;

        if (size == null) {
          return const SizedBox.shrink();
        }

        return Container(
          width: 8,
          height: size.height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: _leftBarBorderRadius,
          ),
        );
      },
    );
  }

  BorderRadius? get _leftBarBorderRadius {
    final radius = widget.borderRadius;

    if (radius == null) {
      return null;
    }

    if (widget.textDirection == TextDirection.ltr) {
      return BorderRadius.only(
        topLeft: radius.topLeft,
        bottomLeft: radius.bottomLeft,
      );
    }

    return BorderRadius.only(
      topRight: radius.topRight,
      bottomRight: radius.bottomRight,
    );
  }
}

enum FlushbarPosition {
  top,
  bottom,
}

enum FlushbarStyle {
  floating,
  grounded,
}

enum FlushbarDismissDirection {
  horizontal,
  vertical,
}

enum FlushbarStatus {
  showing,
  dismissed,
  isAppearing,
  isHiding,
}