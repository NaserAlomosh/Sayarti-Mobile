import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/resend_verification_content_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';

class ResendVerificationUseCaseParams extends BaseUsecaseParams {
  const ResendVerificationUseCaseParams({required this.email});

  final String email;
}

class ResendVerificationUseCase extends BaseRemoteUsecase<
    BaseResponseEntity<ResendVerificationContentEntity>,
    ResendVerificationUseCaseParams> {
  const ResendVerificationUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<ResendVerificationContentEntity>>> call(
    ResendVerificationUseCaseParams params,
  ) => _repository.resendVerification(params);
}
