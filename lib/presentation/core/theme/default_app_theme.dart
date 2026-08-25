import 'package:flutter/material.dart';
import 'package:sayarti_mobile/presentation/core/base/theme/base_theme.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/theme/sayarti_theme_builder.dart';

class DefaultAppTheme extends BaseTheme {
  const DefaultAppTheme();

  @override
  ThemeData get themeData => buildSayartiTheme(
    primary: AppColor.primaryBlue,
    onPrimary: AppColor.white,
    background: AppColor.scaffoldBackgroundColor,
    surface: AppColor.white,
    onSurface: AppColor.primaryBlue,
    border: AppColor.cE0E4E9,
    hintText: AppColor.c82919C,
    descriptionText: AppColor.c64737E,
    disabled: AppColor.cCBD5E0,
    selection: AppColor.cA9D7FD,
  );
}
