import 'package:flutter/material.dart';
import 'package:sayarti_mobile/presentation/core/theme/sayarti_theme_colors.dart';

enum _TextRole { title, hint, description }

class _SemanticText extends StatelessWidget {
  const _SemanticText(
    this.text, {
    required this.role,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.color,
  });

  final String text;
  final _TextRole role;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = SayartiThemeColors.of(context);
    final (fontSize, defaultWeight, height, defaultColor) = switch (role) {
      _TextRole.title => (24.0, FontWeight.w600, 1.25, colors.titleText),
      _TextRole.hint => (14.0, FontWeight.w400, 1.4, colors.hintText),
      _TextRole.description => (
        16.0,
        FontWeight.w400,
        1.5,
        colors.descriptionText,
      ),
    };

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color ?? defaultColor,
        // fontFamily: 'CapitalBank',
        fontSize: fontSize,
        fontWeight: fontWeight ?? defaultWeight,
        height: height,
      ),
    );
  }
}

class CustomTitleText extends StatelessWidget {
  const CustomTitleText(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) => _SemanticText(
    text,
    role: _TextRole.title,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    fontWeight: fontWeight,
    color: color,
  );
}

class CustomHintText extends StatelessWidget {
  const CustomHintText(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) => _SemanticText(
    text,
    role: _TextRole.hint,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    fontWeight: fontWeight,
    color: color,
  );
}

class CustomDescriptionText extends StatelessWidget {
  const CustomDescriptionText(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) => _SemanticText(
    text,
    role: _TextRole.description,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    fontWeight: fontWeight,
    color: color,
  );
}
