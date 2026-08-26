import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/data/networking/error/app_error.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/registration_content_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/resend_verification_content_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/register_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/resend_verification_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/verify_email_usecase.dart';

class _RecordingAuthRepository implements AuthRepository {
  RegisterUseCaseParams? registerParams;
  VerifyEmailUseCaseParams? verifyParams;
  ResendVerificationUseCaseParams? resendParams;
  static const failure = ApiResult.failure(ApiErrorModel(message: 'unused'));

  @override
  Future<ApiResult<BaseResponseEntity<RegistrationContentEntity>>> register(RegisterUseCaseParams params) async { registerParams = params; return failure; }
  @override
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> verifyEmail(VerifyEmailUseCaseParams params) async { verifyParams = params; return failure; }
  @override
  Future<ApiResult<BaseResponseEntity<ResendVerificationContentEntity>>> resendVerification(ResendVerificationUseCaseParams params) async { resendParams = params; return failure; }
  @override
  Future<ApiResult<LoginContentEntity>> login(LoginUseCaseParams params) => throw UnimplementedError();
}

void main() {
  test('RegisterUseCase forwards all five parameters unchanged', () async {
    final repository = _RecordingAuthRepository();
    await RegisterUseCase(repository)(const RegisterUseCaseParams(firstName: 'First', lastName: 'Last', email: 'user@example.com', password: 'Password1', countryCode: 'JO'));
    expect(repository.registerParams?.firstName, 'First'); expect(repository.registerParams?.lastName, 'Last'); expect(repository.registerParams?.email, 'user@example.com'); expect(repository.registerParams?.password, 'Password1'); expect(repository.registerParams?.countryCode, 'JO');
  });
  test('VerifyEmailUseCase forwards email and String OTP unchanged', () async {
    final repository = _RecordingAuthRepository();
    await VerifyEmailUseCase(repository)(const VerifyEmailUseCaseParams(email: 'user@example.com', otp: '012345'));
    expect(repository.verifyParams?.email, 'user@example.com'); expect(repository.verifyParams?.otp, '012345');
  });
  test('ResendVerificationUseCase forwards email unchanged', () async {
    final repository = _RecordingAuthRepository();
    await ResendVerificationUseCase(repository)(const ResendVerificationUseCaseParams(email: 'user@example.com'));
    expect(repository.resendParams?.email, 'user@example.com');
  });
}
