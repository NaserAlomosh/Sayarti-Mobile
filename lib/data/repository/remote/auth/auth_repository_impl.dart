import 'package:sayarti_mobile/data/model/remote/request/auth/login/login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/register_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/resend_verification_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/verify_email_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/error/app_error.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_local_request.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/local/session/session_storage.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/registration_content_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/resend_verification_content_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/register_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/resend_verification_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/verify_email_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._apiService, this._sessionStorage);
  final ApiService _apiService;
  final SessionStorage _sessionStorage;

  @override
  Future<ApiResult<LoginContentEntity>> login(LoginUseCaseParams params) async {
    final remote = await SafeRequest.execute<LoginContentEntity>(
      request: _apiService.login(
        LoginRequestModel(email: params.email, password: params.password),
      ),
    );

    return _persistSession(remote);
  }

  @override
  Future<ApiResult<BaseResponseEntity<RegistrationContentEntity>>> register(
    RegisterUseCaseParams params,
  ) {
    return SafeRequest.execute<RegistrationContentEntity>(
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
  }

  @override
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> verifyEmail(
    VerifyEmailUseCaseParams params,
  ) {
    return SafeRequest.execute<LoginContentEntity>(
      request: _apiService.verifyEmail(
        VerifyEmailRequestModel(email: params.email, otp: params.otp),
      ),
    );
  }

  @override
  Future<ApiResult<BaseResponseEntity<ResendVerificationContentEntity>>>
  resendVerification(
    ResendVerificationUseCaseParams params,
  ) {
    return SafeRequest.execute<ResendVerificationContentEntity>(
      request: _apiService.resendVerification(
        ResendVerificationRequestModel(email: params.email),
      ),
    );
  }

  Future<ApiResult<LoginContentEntity>> _persistSession(
    ApiResult<BaseResponseEntity<LoginContentEntity>> remote,
  ) {
    return remote.when(
      success: (response) async {
        final entity = response.data;
        if (entity == null) {
          return const ApiResult.failure(
            ApiErrorModel(message: 'Invalid authentication response.'),
          );
        }
        final persisted = await SafeLocalRequest.executeVoid(
          request: () => _sessionStorage.save(entity),
        );
        return persisted.when(
          success: (_) => ApiResult.success(entity),
          failure: ApiResult.failure,
        );
      },
      failure: (error) async => ApiResult.failure(error),
    );
  }
}
