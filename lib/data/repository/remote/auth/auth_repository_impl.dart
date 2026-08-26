import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/login/login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/google_login/google_login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/refresh/refresh_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/resend_verification/resend_verification_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/register_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/verify_email/verify_email_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/logout_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/registration_content_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/resend_verification_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/google_login_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/logout_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/refresh_session_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/register_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/verify_email_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/resend_verification_usecase.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> login(
    LoginUseCaseParams params,
  ) async {
    return SafeRequest.execute<LoginContentEntity>(
      request: _apiService.login(
        LoginRequestModel(email: params.email, password: params.password),
      ),
    );
  }

  @override
  Future<ApiResult<BaseResponseEntity<RegistrationContentEntity>>> register(
    RegisterUseCaseParams params,
  ) => SafeRequest.execute<RegistrationContentEntity>(
    request: _apiService.register(
      RegisterRequestModel(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
        countryCode: params.countryCode,
      ),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> verifyEmail(
    VerifyEmailUseCaseParams params,
  ) => SafeRequest.execute<LoginContentEntity>(
    request: _apiService.verifyEmail(
      VerifyEmailRequestModel(email: params.email, otp: params.otp),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<ResendVerificationEntity>>>
  resendVerification(ResendVerificationUseCaseParams params) =>
      SafeRequest.execute<ResendVerificationEntity>(
        request: _apiService.resendVerification(
          ResendVerificationRequestModel(email: params.email),
        ),
      );

  @override
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> googleLogin(
    GoogleLoginUseCaseParams params,
  ) => SafeRequest.execute<LoginContentEntity>(
    request: _apiService.googleLogin(
      GoogleLoginRequestModel(idToken: params.idToken),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> refresh(
    RefreshSessionUseCaseParams params,
  ) => SafeRequest.execute<LoginContentEntity>(
    request: _apiService.refresh(
      RefreshRequestModel(refreshToken: params.refreshToken),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<LogoutEntity>>> logout(
    LogoutUseCaseParams params,
  ) => SafeRequest.execute<LogoutEntity>(
    request: _apiService.logout(
      RefreshRequestModel(refreshToken: params.refreshToken),
    ),
  );
}
