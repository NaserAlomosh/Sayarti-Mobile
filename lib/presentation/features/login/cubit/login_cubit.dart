import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/presentation/core/base/cubit/base_cubit.dart';
import 'package:sayarti_mobile/presentation/core/helper/extension/form_key_extension.dart';
import 'package:sayarti_mobile/presentation/core/helper/extension/string_extension.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());
  final LoginUseCase _loginUseCase;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(
    text: 'naserjordan@gmail.com'
  );
  final emailNodeFoucse = FocusNode();
  final passwordController = TextEditingController(
    text: 'New@1234'
  );
  final passwordNodeFoucse = FocusNode();

  void onEmailSubmit() {
    emailNodeFoucse.nextFocus();
  }

  void checkCamSubmit() {
    if (emailController.text.isValidEmail &&
        passwordController.text.isValidPassword &&
        formKey.isValid) {
      emit(state.copyWith(canSubmit: true));
    } else {
      emit(state.copyWith(canSubmit: false));
    }
  }

  Future<void> login() async {
    showLoading();
    final result = await _loginUseCase(
      LoginUseCaseParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.when(
      success: (response) {
        final data = response.data;
        emit(
          state.copyWith(
            requiredAction: data?.requiredAction,
            loginSuccess: true,
          ),
        );
      },
      failure: (error) {
        showToastError(error: error);
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
