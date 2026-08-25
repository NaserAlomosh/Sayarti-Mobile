part of 'languge_cubit.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  const factory LanguageState({
    required AppLanguage language,
    required Locale locale,
  }) = _LanguageState;

}