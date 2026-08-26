import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/user_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/user/user_repository.dart';

@lazySingleton
class UpdateUserUseCase
    extends BaseRemoteUsecase<UserEntity, UpdateUserUseCaseParams> {
  const UpdateUserUseCase(this._repository);

  final UserRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<UserEntity>>> call(
    UpdateUserUseCaseParams params,
  ) => _repository.updateUser(params);
}

class UpdateUserUseCaseParams extends BaseUsecaseParams {
  const UpdateUserUseCaseParams({
    this.firstName,
    this.lastName,
    this.preferredLanguage,
  });

  final String? firstName;
  final String? lastName;
  final String? preferredLanguage;
}
