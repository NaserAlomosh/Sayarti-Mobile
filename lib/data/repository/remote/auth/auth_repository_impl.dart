import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/login/login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/register_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/verify_email/verify_email_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/registration_content_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/register_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/verify_email_usecase.dart';

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
}
