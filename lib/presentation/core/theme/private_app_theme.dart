import 'package:sayarti_mobile/presentation/core/base/theme/base_theme.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:flutter/material.dart';

class PrivateAppTheme extends BaseTheme {
  const PrivateAppTheme();

  @override
  ThemeData get themeData {
    final baseTheme = ThemeData.light(
      useMaterial3: false,
    );

    return baseTheme.copyWith(
      primaryColorLight: AppColor.white,
      dividerColor: AppColor.c4F555C,
      hintColor: AppColor.primaryRed,
      hoverColor: AppColor.darkBackgroundGrey,
      focusColor: AppColor.white,
      primaryColor: AppColor.white,
      secondaryHeaderColor: AppColor.grey,
      shadowColor: AppColor.primaryRed,
      highlightColor: AppColor.c2A2C2E,
      canvasColor: AppColor.greyContainer,
      primaryColorDark: AppColor.white,
      splashColor: AppColor.black,
      disabledColor: AppColor.c2A2C2E,
      scaffoldBackgroundColor: AppColor.black,
      cardColor: AppColor.primaryRed,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: AppColor.primaryRed,
        secondary: AppColor.primaryRed,
        surface: AppColor.c2A2C2E,
        error: AppColor.red,
        onPrimary: AppColor.white,
        onSecondary: AppColor.white,
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
          borderSide: BorderSide(
            color: AppColor.darkGrey2,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.cB5B5B5,
          ),
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.primaryBlue,
        selectionColor: AppColor.cA9D7FD,
        selectionHandleColor: AppColor.primaryBlue,
      ),

      dialogTheme: const DialogThemeData(
        backgroundColor: AppColor.black,
      ),

      tabBarTheme: const TabBarThemeData(
        indicatorColor: AppColor.white,
        labelColor: AppColor.white,
        unselectedLabelColor: AppColor.grey,
      ),

      appBarTheme: const AppBarThemeData(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.transparent,
        foregroundColor: AppColor.white,
        surfaceTintColor: AppColor.transparent,
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColor.white,
        ),
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
        color: AppColor.primaryRed,
        surfaceTintColor: AppColor.transparent,
        elevation: 0,
      ),

      dividerTheme: const DividerThemeData(
        color: AppColor.c4F555C,
        thickness: 1,
        space: 1,
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.primaryRed,
        linearTrackColor: AppColor.c2A2C2E,
        circularTrackColor: AppColor.c2A2C2E,
      ),
    );
  }
}