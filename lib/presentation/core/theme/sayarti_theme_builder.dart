import 'package:flutter/material.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/theme/sayarti_theme_colors.dart';

ThemeData buildSayartiTheme({
  required Color primary,
  required Color onPrimary,
  required Color background,
  required Color surface,
  required Color onSurface,
  required Color border,
  required Color hintText,
  required Color descriptionText,
  required Color disabled,
  required Color selection,
}) {
  final baseTheme = ThemeData.light(useMaterial3: false);
  final colorScheme = baseTheme.colorScheme.copyWith(
    primary: primary,
    secondary: primary,
    surface: surface,
    error: AppColor.red,
    onPrimary: onPrimary,
    onSecondary: onPrimary,
    onSurface: onSurface,
    onError: AppColor.white,
  );
  const radius = BorderRadius.all(Radius.circular(12));
  final inputBorder = OutlineInputBorder(
    borderRadius: radius,
    borderSide: BorderSide(color: border),
  );

  return baseTheme.copyWith(
    colorScheme: colorScheme,
    primaryColor: onSurface,
    primaryColorLight: onPrimary,
    primaryColorDark: onSurface,
    hintColor: hintText,
    focusColor: onSurface,
    hoverColor: primary,
    highlightColor: surface,
    shadowColor: primary,
    disabledColor: disabled,
    scaffoldBackgroundColor: background,
    cardColor: surface,
    dividerColor: border,
    textTheme: baseTheme.textTheme.apply(
      fontFamily: 'CapitalBank',
      bodyColor: onSurface,
      displayColor: onSurface,
    ),
    primaryTextTheme: baseTheme.primaryTextTheme.apply(
      fontFamily: 'CapitalBank',
      bodyColor: onPrimary,
      displayColor: onPrimary,
    ),
    extensions: <ThemeExtension<dynamic>>[
      SayartiThemeColors(
        titleText: onSurface,
        descriptionText: descriptionText,
        hintText: hintText,
        border: border,
        disabled: disabled,
        success: AppColor.green,
        warning: AppColor.yellow,
      ),
    ],
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: onSurface,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: onSurface),
      actionsIconTheme: IconThemeData(color: onSurface),
      titleTextStyle: TextStyle(
        color: onSurface,
        fontFamily: 'CapitalBank',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      isDense: true,
      filled: true,
      fillColor: surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: inputBorder,
      enabledBorder: inputBorder,
      focusedBorder: inputBorder.copyWith(
        borderSide: BorderSide(color: primary, width: 1.5),
      ),
      errorBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: AppColor.red),
      ),
      focusedErrorBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: AppColor.red, width: 1.5),
      ),
      disabledBorder: inputBorder.copyWith(
        borderSide: BorderSide(color: disabled),
      ),
      hintStyle: TextStyle(color: hintText, fontWeight: FontWeight.w400),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(56)),
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: radius),
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.disabled) ? disabled : primary,
        ),
        foregroundColor: WidgetStatePropertyAll(onPrimary),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(56)),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: radius),
        ),
        foregroundColor: WidgetStatePropertyAll(primary),
        side: WidgetStateProperty.resolveWith(
          (states) => BorderSide(
            color: states.contains(WidgetState.disabled) ? disabled : primary,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(primary)),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(onSurface)),
    ),
    cardTheme: CardThemeData(
      color: surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: radius),
    ),
    dividerTheme: DividerThemeData(color: border, thickness: 1, space: 1),
    dialogTheme: DialogThemeData(
      backgroundColor: surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: radius),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: surface,
      modalBackgroundColor: surface,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? primary : null,
      ),
      side: BorderSide(color: border),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled) ? disabled : primary,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(onPrimary),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? disabled
            : states.contains(WidgetState.selected)
            ? primary
            : border,
      ),
    ),
    chipTheme: baseTheme.chipTheme.copyWith(
      backgroundColor: surface,
      selectedColor: primary.withValues(alpha: .14),
      disabledColor: disabled,
      side: BorderSide(color: border),
      shape: const RoundedRectangleBorder(borderRadius: radius),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: surface,
      indicatorColor: primary.withValues(alpha: .14),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected) ? primary : hintText,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surface,
      selectedItemColor: primary,
      unselectedItemColor: hintText,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: onPrimary,
      elevation: 0,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primary,
      linearTrackColor: border,
      circularTrackColor: border,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: selection,
      selectionHandleColor: primary,
    ),
    bottomAppBarTheme: BottomAppBarThemeData(
      color: surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: primary,
      labelColor: primary,
      unselectedLabelColor: hintText,
    ),
  );
}
