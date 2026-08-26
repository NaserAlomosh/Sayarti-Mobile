import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/user/delete_user_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/user/user_repository.dart';

@lazySingleton
class DeleteAccountUseCase {
  const DeleteAccountUseCase(this._repository);

  final UserRepository _repository;

  Future<ApiResult<BaseResponseEntity<DeleteUserEntity>>> call() =>
      _repository.deleteAccount();
}
