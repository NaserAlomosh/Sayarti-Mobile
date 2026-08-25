import 'package:sayarti_mobile/presentation/core/base/theme/base_theme.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:flutter/material.dart';

class DefaultAppTheme extends BaseTheme {
  const DefaultAppTheme();

  @override
  ThemeData get themeData {
    final baseTheme = ThemeData.light(
      useMaterial3: false,
    );

    return baseTheme.copyWith(
      primaryColorLight: AppColor.grey,
      dividerColor: AppColor.cE0E4E9,
      hintColor: AppColor.blue,
      hoverColor: AppColor.primaryBlue,
      primaryColor: AppColor.black,
      secondaryHeaderColor: AppColor.grey,
      shadowColor: AppColor.primaryBlue,
      highlightColor: AppColor.white,
      primaryColorDark: AppColor.c26333F,
      cardColor: AppColor.primaryBlue,
      disabledColor: AppColor.white,
      scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,

      textTheme: baseTheme.textTheme.apply(
        fontFamily: 'CapitalBank',
        bodyColor: AppColor.primaryBlue,
        displayColor: AppColor.black,
      ),

      primaryTextTheme: baseTheme.primaryTextTheme.apply(
        fontFamily: 'CapitalBank',
        bodyColor: AppColor.white,
        displayColor: AppColor.white,
      ),

      colorScheme: baseTheme.colorScheme.copyWith(
        primary: AppColor.primaryBlue,
        secondary: AppColor.white,
        surface: AppColor.white,
        error: AppColor.red,
        onPrimary: AppColor.white,
        onSecondary: AppColor.white,
        onSurface: AppColor.primaryBlue,
        onError: AppColor.white,
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
        indicatorColor: AppColor.primaryBlue,
        labelColor: AppColor.primaryBlue,
        unselectedLabelColor: AppColor.grey,
      ),

      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.transparent,
        foregroundColor: AppColor.primaryBlue,
        surfaceTintColor: AppColor.transparent,
        iconTheme: IconThemeData(
          color: AppColor.primaryBlue,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColor.primaryBlue,
        ),
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: AppColor.primaryBlue,
          fontFamily: 'CapitalBank',
          fontWeight: FontWeight.w500,
        ),
      ),

      bottomAppBarTheme: const BottomAppBarThemeData(
        color: AppColor.scaffoldBackgroundColor,
        surfaceTintColor: AppColor.transparent,
        elevation: 0,
      ),

      cardTheme: const CardThemeData(
        color: AppColor.white,
        surfaceTintColor: AppColor.transparent,
      ),

      dividerTheme: const DividerThemeData(
        color: AppColor.cE0E4E9,
        thickness: 1,
        space: 1,
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.primaryBlue,
        linearTrackColor: AppColor.cE0E4E9,
        circularTrackColor: AppColor.cE0E4E9,
      ),
    );
  }
}