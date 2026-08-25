import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/error/api_messages.dart';
import 'package:sayarti_mobile/domain/entity/local/language/get_user_languge_entity.dart';
import 'package:sayarti_mobile/domain/usecase/local/language/get_user_language_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/local/language/save_user_language_usecase.dart';
import 'package:sayarti_mobile/presentation/core/base/cubit/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'languge_state.dart';
part 'languge_cubit.freezed.dart';

enum AppLanguage {
  arabic(code: 'ar', locale: Locale('ar')),
  english(code: 'en', locale: Locale('en'));

  const AppLanguage({required this.code, required this.locale});

  final String code;
  final Locale locale;

  static AppLanguage fromCode(String? code) {
    final normalizedCode = code
        ?.trim()
        .toLowerCase()
        .split(RegExp('[-_]'))
        .first;

    return AppLanguage.values.firstWhere(
      (language) => language.code == normalizedCode,
      orElse: () => AppLanguage.english,
    );
  }
}

@lazySingleton
class LanguageCubit extends BaseCubit<LanguageState> {
  LanguageCubit(this._getUserLanguageUsecase, this._saveUserLanguageUsecase)
    : super(
        LanguageState(
          language: AppLanguage.fromCode(
            WidgetsBinding.instance.platformDispatcher.locale.languageCode,
          ),
          locale: AppLanguage.fromCode(
            WidgetsBinding.instance.platformDispatcher.locale.languageCode,
          ).locale,
        ),
      );

  final GetUserLanguageUsecase _getUserLanguageUsecase;
  final SaveUserLanguageUsecase _saveUserLanguageUsecase;

  @override
  Future<void> init() async {
    await super.init();
    await _getUserLanguage();
  }

  Future<void> _getUserLanguage() async {
    final result = await _getUserLanguageUsecase(const GetUserLanguageParams());

    result.when(
      success: _onGetLanguageSuccess,
      failure: (_) {
        appLanguage = state.language;
      },
    );
  }

  Future<void> changeLanguage(AppLanguage language) async {
    if (state.language == language) {
      appLanguage = state.language;

      return;
    }

    final result = await _saveUserLanguageUsecase(
      SaveUserLanguageParams(languageCode: language.code),
    );

    result.when(
      success: (_) {
        appLanguage = language;
        _emitLanguage(language);
      },
      failure: (_) {
        // Keep the current language when saving fails.
      },
    );
  }

  Future<void> toggleLanguage() {
    final nextLanguage = isArabic ? AppLanguage.english : AppLanguage.arabic;

    return changeLanguage(nextLanguage);
  }

  void _onGetLanguageSuccess(GetUserLanguageEntity entity) {
    final language = AppLanguage.fromCode(entity.code);

    _emitLanguage(language);
  }

  void _emitLanguage(AppLanguage language) {
    appLanguage = language;

    emit(state.copyWith(language: language, locale: language.locale));
  }

  bool get isArabic => state.language == AppLanguage.arabic;

  bool get isEnglish => state.language == AppLanguage.english;

  Locale get locale => state.locale;

  AppLanguage get language => state.language;
}
