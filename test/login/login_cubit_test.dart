import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/presentation/features/login/cubit/login_cubit.dart';

class _Repository implements AuthRepository {
  @override
  Future<ApiResult<LoginContentEntity>> login(LoginUseCaseParams params) async =>
      throw UnimplementedError();
}

void main() {
  test('initial state and form validation use onChanged without listeners', () async {
    final cubit = LoginCubit(LoginUseCase(_Repository()));
    expect(cubit.state.canSubmit, isFalse);
    cubit.emailController.text = 'not-an-email';
    cubit.passwordController.text = 'x';
    cubit.onFormChanged();
    expect(
      cubit.validateEmail(
        cubit.emailController.text,
        requiredMessage: 'required',
        invalidMessage: 'invalid',
      ),
      'invalid',
    );
    expect(cubit.state.canSubmit, isFalse);
    cubit.emailController.text = 'user@example.com';
    cubit.onFormChanged();
    expect(cubit.state.canSubmit, isTrue);
    cubit.passwordController.clear();
    cubit.onFormChanged();
    expect(
      cubit.validatePassword(
        cubit.passwordController.text,
        requiredMessage: 'required',
      ),
      'required',
    );
    expect(cubit.state.canSubmit, isFalse);
    await cubit.close();
  });

  test('password visibility toggles', () async {
    final cubit = LoginCubit(LoginUseCase(_Repository()));
    expect(cubit.state.obscurePassword, isTrue);
    cubit.togglePasswordVisibility();
    expect(cubit.state.obscurePassword, isFalse);
    await cubit.close();
  });
}
