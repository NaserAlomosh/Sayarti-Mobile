import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/presentation/core/base/cubit/base_cubit.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());
  final LoginUseCase _loginUseCase;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(
    String? value, {
    required String requiredMessage,
    required String invalidMessage,
  }) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return requiredMessage;
    if (!_emailPattern.hasMatch(email)) return invalidMessage;
    return null;
  }

  String? validatePassword(String? value, {required String requiredMessage}) {
    if (value == null || value.isEmpty) return requiredMessage;
    return null;
  }

  void onFormChanged() {
    formKey.currentState?.validate();
    final canSubmit =
        _emailPattern.hasMatch(emailController.text.trim()) &&
        passwordController.text.isNotEmpty;
    if (state.canSubmit == canSubmit) return;
    emit(state.copyWith(canSubmit: canSubmit), withoutCloseLoading: true);
  }

  void togglePasswordVisibility() => emit(
    state.copyWith(obscurePassword: !state.obscurePassword),
    withoutCloseLoading: true,
  );

  Future<void> login() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    showLoading();
    final result = await _loginUseCase(
      LoginUseCaseParams(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );
    result.when(
      success: (response) {
        final login = response;
        emit(
          state.copyWith(
            loginSuccess: true,
            requiredAction: login.requiredAction,
          ),
        );
      },
      failure: (error) => showToastError(title: error.message),
    );
  }

  static final _emailPattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
