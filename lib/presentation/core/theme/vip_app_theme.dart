import 'package:sayarti_mobile/presentation/core/base/theme/base_theme.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:flutter/material.dart';

class VipAppTheme extends BaseTheme {
  const VipAppTheme();

  @override
  ThemeData get themeData {
    final baseTheme = ThemeData.light(useMaterial3: false);

    return baseTheme.copyWith(
      primaryColorLight: AppColor.white,
      dividerColor: AppColor.darkContainerColor,
      hintColor: AppColor.golden,
      hoverColor: AppColor.darkBackgroundGrey,
      focusColor: AppColor.white,
      primaryColor: AppColor.white,
      secondaryHeaderColor: AppColor.darkBackgroundGrey,
      shadowColor: AppColor.golden,
      highlightColor: AppColor.darkContainerColor,
      primaryColorDark: AppColor.white,
      canvasColor: AppColor.greyContainer,
      splashColor: AppColor.black,
      disabledColor: AppColor.darkContainerColor,
      scaffoldBackgroundColor: AppColor.black,
      cardColor: AppColor.golden,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: AppColor.golden,
        secondary: AppColor.beige1,
        surface: AppColor.darkContainerColor,
        error: AppColor.red,
        onPrimary: AppColor.white,
        onSecondary: AppColor.primaryBlue,
        onSurface: AppColor.white,
        onError: AppColor.white,
      ),

      textTheme: baseTheme.textTheme.apply(
        fontFamily: 'CapitalBank',
        bodyColor: AppColor.white,
        displayColor: AppColor.white,
      ),

      primaryTextTheme: baseTheme.primaryTextTheme.apply(
        fontFamily: 'CapitalBank',
        bodyColor: AppColor.white,
        displayColor: AppColor.white,
      ),

      inputDecorationTheme: const InputDecorationThemeData(
        isDense: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.darkGrey2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.cB5B5B5),
        ),
        hintStyle: TextStyle(fontWeight: FontWeight.w400),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.primaryBlue,
        selectionColor: AppColor.cA9D7FD,
        selectionHandleColor: AppColor.primaryBlue,
      ),

      dialogTheme: const DialogThemeData(backgroundColor: AppColor.golden),

      tabBarTheme: const TabBarThemeData(
        indicatorColor: AppColor.white,
        labelColor: AppColor.white,
        unselectedLabelColor: AppColor.darkBackgroundGrey,
      ),

      appBarTheme: const AppBarThemeData(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.transparent,
        foregroundColor: AppColor.white,
        surfaceTintColor: AppColor.transparent,
        iconTheme: IconThemeData(color: AppColor.white),
        actionsIconTheme: IconThemeData(color: AppColor.white),
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: AppColor.white,
          fontFamily: 'CapitalBank',
          fontWeight: FontWeight.w500,
        ),
      ),

      bottomAppBarTheme: const BottomAppBarThemeData(
        color: AppColor.black,
        surfaceTintColor: AppColor.transparent,
        elevation: 0,
      ),

      cardTheme: const CardThemeData(
        color: AppColor.beige1,
        surfaceTintColor: AppColor.transparent,
        elevation: 0,
      ),

      dividerTheme: const DividerThemeData(
        color: AppColor.darkContainerColor,
        thickness: 1,
        space: 1,
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.golden,
        linearTrackColor: AppColor.darkContainerColor,
        circularTrackColor: AppColor.darkContainerColor,
      ),
    );
  }
}
