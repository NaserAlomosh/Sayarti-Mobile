import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/registration_content_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/logout_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/resend_verification_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/google_login_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/logout_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/refresh_session_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/register_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/resend_verification_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/verify_email_usecase.dart';

abstract class AuthRepository {
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> login(
    LoginUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<RegistrationContentEntity>>> register(
    RegisterUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> verifyEmail(
    VerifyEmailUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<ResendVerificationEntity>>>
  resendVerification(ResendVerificationUseCaseParams params);

  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> googleLogin(
    GoogleLoginUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> refresh(
    RefreshSessionUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<LogoutEntity>>> logout(
    LogoutUseCaseParams params,
  );
}
