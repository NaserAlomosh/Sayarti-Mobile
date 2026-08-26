import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';

class LoginUseCaseParams extends BaseUsecaseParams {
  const LoginUseCaseParams({required this.email, required this.password});
  final String email;
  final String password;
}

class LoginUseCase
    extends BaseRemoteUsecase<LoginContentEntity, LoginUseCaseParams> {
  const LoginUseCase(this._repository);
  final AuthRepository _repository;

  @override
    Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> call(LoginUseCaseParams params) =>
      _repository.login(params);
}
