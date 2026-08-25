import 'package:flutter/material.dart';

Future<T?> showAppModalBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  double initialChildSize = 0.8,
  double minChildSize = 0.2,
  double maxChildSize = 0.8,
  double? height,
  bool isDraggable = true,
  bool isDismissible = true,
  bool enableDrag = true,
  bool showDragHandle = true,
  bool showScrollbar = false,
  bool shouldCloseOnMinExtent = true,
  bool useSafeArea = true,
  bool resizeForKeyboard = true,
  bool detectUserActivity = false,
  bool scrollable = true,
  Color? backgroundColor,
  Color? barrierColor,
  EdgeInsetsGeometry contentPadding = EdgeInsets.zero,
  BorderRadius borderRadius = const BorderRadius.vertical(
    top: Radius.circular(16),
  ),
  VoidCallback? onUserActivity,
  VoidCallback? onComplete,
}) async {
  final resolvedMinChildSize = minChildSize.clamp(0.0, 1.0);
  final resolvedMaxChildSize = maxChildSize.clamp(
    resolvedMinChildSize,
    1.0,
  );

  final resolvedInitialChildSize = initialChildSize.clamp(
    resolvedMinChildSize,
    resolvedMaxChildSize,
  );

  final result = await showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: enableDrag && isDraggable,
    backgroundColor: Colors.transparent,
    barrierColor: barrierColor,
    builder: (sheetContext) {
      return _AppModalBottomSheet(
        initialChildSize: resolvedInitialChildSize,
        minChildSize: resolvedMinChildSize,
        maxChildSize: resolvedMaxChildSize,
        height: height,
        isDraggable: isDraggable,
        showDragHandle: showDragHandle,
        showScrollbar: showScrollbar,
        shouldCloseOnMinExtent: shouldCloseOnMinExtent,
        useSafeArea: useSafeArea,
        resizeForKeyboard: resizeForKeyboard,
        detectUserActivity: detectUserActivity,
        scrollable: scrollable,
        backgroundColor:
            backgroundColor ?? Theme.of(sheetContext).scaffoldBackgroundColor,
        contentPadding: contentPadding,
        borderRadius: borderRadius,
        onUserActivity: onUserActivity,
        child: child,
      );
    },
  );

  onComplete?.call();

  return result;
}

class _AppModalBottomSheet extends StatefulWidget {
  const _AppModalBottomSheet({
    required this.child,
    required this.initialChildSize,
    required this.minChildSize,
    required this.maxChildSize,
    required this.isDraggable,
    required this.showDragHandle,
    required this.showScrollbar,
    required this.shouldCloseOnMinExtent,
    required this.useSafeArea,
    required this.resizeForKeyboard,
    required this.detectUserActivity,
    required this.scrollable,
    required this.backgroundColor,
    required this.contentPadding,
    required this.borderRadius,
    this.height,
    this.onUserActivity,
  });

  final Widget child;

  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final double? height;

  final bool isDraggable;
  final bool showDragHandle;
  final bool showScrollbar;
  final bool shouldCloseOnMinExtent;
  final bool useSafeArea;
  final bool resizeForKeyboard;
  final bool detectUserActivity;
  final bool scrollable;

  final Color backgroundColor;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;

  final VoidCallback? onUserActivity;

  @override
  State<_AppModalBottomSheet> createState() =>
      _AppModalBottomSheetState();
}

class _AppModalBottomSheetState extends State<_AppModalBottomSheet> {
  final ScrollController _fixedScrollController = ScrollController();

  @override
  void dispose() {
    _fixedScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;

    final bottomPadding = widget.resizeForKeyboard
        ? keyboardHeight
        : 0.0;

    final content = AnimatedPadding(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      padding: EdgeInsets.only(
        bottom: bottomPadding,
      ),
      child: ClipRRect(
        borderRadius: widget.borderRadius,
        child: ColoredBox(
          color: widget.backgroundColor,
          child: widget.useSafeArea
              ? SafeArea(
                  top: false,
                  child: _buildContent(),
                )
              : _buildContent(),
        ),
 
      ),
    );

    if (!widget.detectUserActivity) {
      return content;
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) {
        widget.onUserActivity?.call();
      },
      onPointerMove: (_) {
        widget.onUserActivity?.call();
      },
      child: content,
    );
  }

  Widget _buildContent() {
    if (widget.isDraggable) {
      return _buildDraggableContent();
    }

    return _buildFixedContent();
  }

  Widget _buildDraggableContent() {
    return DraggableScrollableSheet(
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      shouldCloseOnMinExtent: widget.shouldCloseOnMinExtent,
      expand: false,
      builder: (context, scrollController) {
        return _SheetBody(
          scrollController: scrollController,
          showDragHandle: widget.showDragHandle,
          showScrollbar: widget.showScrollbar,
          scrollable: widget.scrollable,
          contentPadding: widget.contentPadding,
          child: widget.child,
        );
      },
    );
  }

  Widget _buildFixedContent() {
    final body = _SheetBody(
      scrollController: _fixedScrollController,
      showDragHandle: widget.showDragHandle,
      showScrollbar: widget.showScrollbar,
      scrollable: widget.scrollable,
      contentPadding: widget.contentPadding,
      child: widget.child,
    );

    if (widget.height != null) {
      return SizedBox(
        height: widget.height,
        child: body,
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      child: body,
    );
  }
}

class _SheetBody extends StatelessWidget {
  const _SheetBody({
    required this.child,
    required this.scrollController,
    required this.showDragHandle,
    required this.showScrollbar,
    required this.scrollable,
    required this.contentPadding,
  });

  final Widget child;
  final ScrollController scrollController;

  final bool showDragHandle;
  final bool showScrollbar;
  final bool scrollable;

  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showDragHandle)
          const _BottomSheetDragHandle(),

        Flexible(
          child: Padding(
            padding: contentPadding,
            child: _buildBody(),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    if (!scrollable) {
      return child;
    }

    final scrollView = SingleChildScrollView(
      controller: scrollController,
      keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const ClampingScrollPhysics(),
      child: child,
    );

    if (!showScrollbar) {
      return scrollView;
    }

    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      radius: const Radius.circular(8),
      thickness: 4,
      child: scrollView,
    );
  }
}

class _BottomSheetDragHandle extends StatelessWidget {
  const _BottomSheetDragHandle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 16,
      ),
      child: Center(
        child: Container(
          width: 48,
          height: 4,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}