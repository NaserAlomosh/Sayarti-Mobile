import 'package:flutter/material.dart';

class CustomAppCheckBox extends StatelessWidget {
  const CustomAppCheckBox({
    super.key,
    this.isChecked = false,
    this.height,
    this.width,
    this.size,
    this.isDeActive = false,
    this.onTap,
  });

  final bool isChecked;
  final double? height;
  final double? width;
  final double? size;
  final bool isDeActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Ink(
          height: height ?? 22,
          width: width ?? 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isChecked
                ? Theme.of(context).hintColor
                : isDeActive
                    ? theme.disabledColor.withValues(alpha: 0.3)
                    : colorScheme.surface,
            border: Border.all(
              color: isChecked
                  ? Theme.of(context).hintColor
                  : isDeActive
                      ? theme.disabledColor
                      : colorScheme.primary,
            ),
          ),
          child: isChecked
              ? Icon(
                  Icons.check,
                  color: colorScheme.onPrimary,
                  size: size ?? 14,
                )
              : null,
        ),
      ),
    );
  }
}