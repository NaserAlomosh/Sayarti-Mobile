import 'package:flutter/material.dart';
import 'package:sayarti_mobile/presentation/core/base/theme/base_theme.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/theme/sayarti_theme_builder.dart';

class VipAppTheme extends BaseTheme {
  const VipAppTheme();

  @override
  ThemeData get themeData => buildSayartiTheme(
    primary: AppColor.golden,
    onPrimary: AppColor.white,
    background: AppColor.black,
    surface: AppColor.darkContainerColor,
    onSurface: AppColor.white,
    border: AppColor.c4F555C,
    hintText: AppColor.darkBackgroundGrey,
    descriptionText: AppColor.greyContainer,
    disabled: AppColor.darkContainerColor,
    selection: AppColor.beige1,
  );
}
