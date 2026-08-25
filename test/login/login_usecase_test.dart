import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/error/app_error.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';

class _RecordingRepository implements AuthRepository {
  LoginUseCaseParams? received;
  @override
  Future<ApiResult<LoginContentEntity>> login(LoginUseCaseParams params) async {
    received = params;
    return const ApiResult.failure(ApiErrorModel(message: 'unused'));
  }
}

void main() {
  test('LoginUseCase forwards exact email and password', () async {
    final repository = _RecordingRepository();
    final useCase = LoginUseCase(repository);
    await useCase(const LoginUseCaseParams(email: 'user@example.com', password: ' secret '));
    expect(repository.received?.email, 'user@example.com');
    expect(repository.received?.password, ' secret ');
  });
}
