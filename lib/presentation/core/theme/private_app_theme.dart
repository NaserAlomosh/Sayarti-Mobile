import 'package:flutter/material.dart';
import 'package:sayarti_mobile/presentation/core/base/theme/base_theme.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/theme/sayarti_theme_builder.dart';

class PrivateAppTheme extends BaseTheme {
  const PrivateAppTheme();

  @override
  ThemeData get themeData => buildSayartiTheme(
    primary: AppColor.primaryRed,
    onPrimary: AppColor.white,
    background: AppColor.black,
    surface: AppColor.c2A2C2E,
    onSurface: AppColor.white,
    border: AppColor.c4F555C,
    hintText: AppColor.cA6A5AE,
    descriptionText: AppColor.cC8C8C8,
    disabled: AppColor.c4F555C,
    selection: AppColor.cA02B33,
  );
}
