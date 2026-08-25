part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool canSubmit,
    @Default(true) bool obscurePassword,
    @Default(false) bool loginSuccess,
    String? requiredAction,
  }) = _LoginState;
}
