import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/user_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/user/user_repository.dart';

@lazySingleton
class ChangeDefaultCurrencyUseCase extends BaseRemoteUsecase<
    UserEntity,
    ChangeDefaultCurrencyUseCaseParams> {
  const ChangeDefaultCurrencyUseCase(this._repository);

  final UserRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<UserEntity>>> call(
    ChangeDefaultCurrencyUseCaseParams params,
  ) => _repository.changeDefaultCurrency(params);
}

class ChangeDefaultCurrencyUseCaseParams extends BaseUsecaseParams {
  const ChangeDefaultCurrencyUseCaseParams({required this.currencyCode});

  final String currencyCode;
}
