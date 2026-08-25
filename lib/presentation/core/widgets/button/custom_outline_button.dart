import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.backgroundColor = Colors.transparent,
    this.borderColor,
    this.width,
    this.height = 56,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.fontFamily,
    this.borderRadius = 12,
    this.borderWidth = 2,
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
  });

  final String text;
  final VoidCallback? onPressed;

  final Color? textColor;
  final Color backgroundColor;
  final Color? borderColor;

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
  State<CustomOutlinedButton> createState() =>
      _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState
    extends State<CustomOutlinedButton> {
  bool _pressed = false;

  bool get _enabled =>
      widget.onPressed != null && !widget.isLoading;

  void _updatePressed(bool value) {
    if (!widget.enablePressAnimation || !_enabled) {
      return;
    }

    if (_pressed != value) {
      setState(() => _pressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textColor =
        widget.textColor ?? theme.shadowColor;

    final borderColor =
        widget.borderColor ?? Colors.grey.shade300;

    Widget button = MaterialButton(
      minWidth: widget.width,
      height: widget.height,
      elevation: 0,
      color: widget.backgroundColor,
      disabledColor: widget.backgroundColor,
      padding: widget.padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          widget.borderRadius,
        ),
        side: BorderSide(
          color: borderColor,
          width: widget.borderWidth,
        ),
      ),
      onPressed: _enabled ? widget.onPressed : null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: widget.isLoading
            ? widget.loadingWidget ??
                SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color:
                        widget.loadingColor ?? textColor,
                  ),
                )
            : Text(
                widget.text,
                key: const ValueKey('text'),
                style: TextStyle(
                  color: _enabled
                      ? textColor
                      : textColor.withValues(alpha: .5),
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                  fontFamily: widget.fontFamily,
                ),
              ),
      ),
    );

    if (widget.enablePressAnimation) {
      button = Listener(
        onPointerDown: (_) => _updatePressed(true),
        onPointerUp: (_) => _updatePressed(false),
        onPointerCancel: (_) => _updatePressed(false),
        child: AnimatedScale(
          scale: _pressed ? widget.pressedScale : 1,
          duration: _pressed
              ? widget.pressAnimationDuration
              : widget.releaseAnimationDuration,
          curve:
              _pressed ? Curves.easeOut : Curves.easeOutBack,
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