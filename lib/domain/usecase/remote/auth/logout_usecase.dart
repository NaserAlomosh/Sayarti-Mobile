import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/logout_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';

@lazySingleton
class LogoutUseCase extends BaseRemoteUsecase<LogoutEntity, LogoutUseCaseParams> {
  const LogoutUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<LogoutEntity>>> call(
    LogoutUseCaseParams params,
  ) => _repository.logout(params);
}

class LogoutUseCaseParams extends BaseUsecaseParams {
  const LogoutUseCaseParams({required this.refreshToken});
  final String refreshToken;
}
