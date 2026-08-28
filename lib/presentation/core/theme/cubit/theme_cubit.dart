import 'package:sayarti_mobile/presentation/core/theme/default_app_theme.dart';
import 'package:sayarti_mobile/presentation/core/theme/private_app_theme.dart';
import 'package:sayarti_mobile/presentation/core/theme/theme_enum.dart';
import 'package:sayarti_mobile/presentation/core/theme/vip_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            themeData: const VipAppTheme().themeData,
          ),
        );

  void setDefaultTheme() {
    _setTheme(
      type: AppThemeType.defaultTheme,
      themeData: const VipAppTheme().themeData,
    );
  }

  void setVipTheme() {
    _setTheme(
      type: AppThemeType.vip,
      themeData: const VipAppTheme().themeData,
    );
  }

  void setPrivateTheme() {
    _setTheme(
      type: AppThemeType.private,
      themeData: const PrivateAppTheme().themeData,
    );
  }

  void setTheme(AppThemeType themeType) {
    switch (themeType) {
      case AppThemeType.defaultTheme:
        setDefaultTheme();

      case AppThemeType.vip:
        setVipTheme();

      case AppThemeType.private:
        setPrivateTheme();
    }
  }

  void setThemeFromUserType({
    required bool isVip,
    required bool isPrivate,
  }) {
    if (isVip) {
      setVipTheme();
      return;
    }

    if (isPrivate) {
      setPrivateTheme();
      return;
    }

    setDefaultTheme();
  }

  void _setTheme({
    required AppThemeType type,
    required ThemeData themeData,
  }) {
    if (state.themeType == type) {
      return;
    }

    emit(
      state.copyWith(
        themeType: type,
        themeData: themeData,
      ),
    );
  }
}