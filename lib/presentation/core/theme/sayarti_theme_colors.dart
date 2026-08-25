import 'package:flutter/material.dart';

/// Semantic colors that are not represented precisely by [ColorScheme].
@immutable
class SayartiThemeColors extends ThemeExtension<SayartiThemeColors> {
  const SayartiThemeColors({
    required this.titleText,
    required this.descriptionText,
    required this.hintText,
    required this.border,
    required this.disabled,
    required this.success,
    required this.warning,
  });

  final Color titleText;
  final Color descriptionText;
  final Color hintText;
  final Color border;
  final Color disabled;
  final Color success;
  final Color warning;

  static SayartiThemeColors of(BuildContext context) {
    final colors = Theme.of(context).extension<SayartiThemeColors>();
    assert(colors != null, 'SayartiThemeColors must be registered in ThemeData.');
    return colors!;
  }

  @override
  SayartiThemeColors copyWith({
    Color? titleText,
    Color? descriptionText,
    Color? hintText,
    Color? border,
    Color? disabled,
    Color? success,
    Color? warning,
  }) {
    return SayartiThemeColors(
      titleText: titleText ?? this.titleText,
      descriptionText: descriptionText ?? this.descriptionText,
      hintText: hintText ?? this.hintText,
      border: border ?? this.border,
      disabled: disabled ?? this.disabled,
      success: success ?? this.success,
      warning: warning ?? this.warning,
    );
  }

  @override
  SayartiThemeColors lerp(
    covariant SayartiThemeColors? other,
    double t,
  ) {
    if (other == null) return this;
    return SayartiThemeColors(
      titleText: Color.lerp(titleText, other.titleText, t)!,
      descriptionText: Color.lerp(descriptionText, other.descriptionText, t)!,
      hintText: Color.lerp(hintText, other.hintText, t)!,
      border: Color.lerp(border, other.border, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }
}
