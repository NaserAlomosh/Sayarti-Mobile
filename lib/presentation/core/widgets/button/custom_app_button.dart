import 'package:flutter/material.dart';

class CustomAppButton extends StatefulWidget {
  const CustomAppButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.isActive = true,
    this.textColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.borderColor,
    this.disabledBorderColor,
    this.width,
    this.height = 56,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.fontFamily,
    this.borderRadius = 12,
    this.borderWidth = 0,
    this.padding = const EdgeInsetsDirectional.only(
      top: 16,
      bottom: 12,
    ),
    this.margin,
    this.isLoading = false,
    this.loadingWidget,
    this.loadingColor,
    this.enablePressAnimation = true,
    this.pressedScale = 0.96,
    this.pressAnimationDuration = const Duration(milliseconds: 100),
    this.releaseAnimationDuration = const Duration(milliseconds: 180),
  }) : assert(
         pressedScale > 0 && pressedScale <= 1,
         'pressedScale must be greater than 0 and less than or equal to 1.',
       );

  final String text;
  final VoidCallback? onPressed;

  /// Controls whether the button is active.
  ///
  /// The button is disabled when this is false.
  final bool isActive;

  final Color? textColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? borderColor;
  final Color? disabledBorderColor;

  final double? width;
  final double height;

  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;

  final double borderRadius;
  final double borderWidth;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;

  final bool isLoading;
  final Widget? loadingWidget;
  final Color? loadingColor;

  final bool enablePressAnimation;
  final double pressedScale;
  final Duration pressAnimationDuration;
  final Duration releaseAnimationDuration;

  @override
  State<CustomAppButton> createState() => _CustomAppButtonState();
}

class _CustomAppButtonState extends State<CustomAppButton> {
  bool _pressed = false;

  bool get _isEnabled {
    return widget.isActive &&
        widget.onPressed != null &&
        !widget.isLoading;
  }

  void _updatePressed(bool value) {
    if (!widget.enablePressAnimation || !_isEnabled) {
      return;
    }

    if (_pressed == value) {
      return;
    }

    setState(() {
      _pressed = value;
    });
  }

  @override
  void didUpdateWidget(covariant CustomAppButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_isEnabled && _pressed) {
      setState(() {
        _pressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor =
        widget.backgroundColor ?? theme.colorScheme.primary;

    final disabledBackgroundColor =
        widget.disabledBackgroundColor ?? theme.disabledColor;

    final textColor =
        widget.textColor ?? theme.colorScheme.onPrimary;

    final borderColor = _isEnabled
        ? widget.borderColor
        : widget.disabledBorderColor ??
              theme.disabledColor;

    Widget button = MaterialButton(
      minWidth: widget.width,
      height: widget.height,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      color: backgroundColor,
      disabledColor: disabledBackgroundColor,
      padding: widget.padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          widget.borderRadius,
        ),
        side: borderColor == null || widget.borderWidth <= 0
            ? BorderSide.none
            : BorderSide(
                color: borderColor,
                width: widget.borderWidth,
              ),
      ),
      onPressed: _isEnabled ? widget.onPressed : null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 0.92,
                end: 1,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: widget.isLoading
            ? KeyedSubtree(
                key: const ValueKey('loading'),
                child:
                    widget.loadingWidget ??
                    SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: widget.loadingColor ?? textColor,
                      ),
                    ),
              )
            : Text(
                widget.text,
                key: const ValueKey('text'),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                  fontFamily: widget.fontFamily,
                ),
              ),
      ),
    );

    if (widget.enablePressAnimation) {
      button = Listener(
        behavior: HitTestBehavior.opaque,
        onPointerDown: (_) => _updatePressed(true),
        onPointerUp: (_) => _updatePressed(false),
        onPointerCancel: (_) => _updatePressed(false),
        child: AnimatedScale(
          scale: _pressed ? widget.pressedScale : 1,
          duration: _pressed
              ? widget.pressAnimationDuration
              : widget.releaseAnimationDuration,
          curve: _pressed ? Curves.easeOut : Curves.easeOutBack,
          child: button,
        ),
      );
    }

    return Padding(
      padding: widget.margin ?? EdgeInsetsDirectional.zero,
      child: button,
    );
  }
}
