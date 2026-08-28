import 'package:flutter/material.dart';

class CustomAppTextButton extends StatefulWidget {
  const CustomAppTextButton({
    required this.text,
    super.key,
    this.onTap,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.underline = false,
    this.textAlign,
  });

  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool underline;
  final TextAlign? textAlign;

  @override
  State<CustomAppTextButton> createState() => _CustomAppTextButtonState();
}

class _CustomAppTextButtonState extends State<CustomAppTextButton> {
  bool _isPressed = false;

  bool get _isEnabled => widget.onTap != null;

  void _setPressed(bool value) {
    if (_isPressed == value) return;

    setState(() => _isPressed = value);
  }

  @override
  void didUpdateWidget(covariant CustomAppTextButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_isEnabled) {
      _isPressed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = widget.color ?? Theme.of(context).primaryColor;

    final duration = Duration(
      milliseconds: _isPressed ? 100 : 180,
    );

    return Semantics(
      button: true,
      enabled: _isEnabled,
      child: MouseRegion(
        cursor: _isEnabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onTap,
          onTapDown: _isEnabled ? (_) => _setPressed(true) : null,
          onTapUp: _isEnabled ? (_) => _setPressed(false) : null,
          onTapCancel: _isEnabled ? () => _setPressed(false) : null,
          child: AnimatedScale(
            scale: _isPressed ? 0.95 : 1.0,
            duration: duration,
            curve: Curves.easeOutCubic,
            child: AnimatedOpacity(
              opacity: !_isEnabled
                  ? 0.4
                  : _isPressed
                      ? 0.65
                      : 1.0,
              duration: duration,
              curve: Curves.easeOutCubic,
              child: Text(
                widget.text,
                textAlign: widget.textAlign,
                style: TextStyle(
                  color: textColor,
                  fontSize: widget.fontSize ?? 14,
                  fontWeight: widget.fontWeight ?? FontWeight.w500,
                  decoration: widget.underline
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}