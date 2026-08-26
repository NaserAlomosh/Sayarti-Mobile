import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/registration_content_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';

class RegisterUseCaseParams extends BaseUsecaseParams {
  const RegisterUseCaseParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.countryCode,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String countryCode;
}

class RegisterUseCase extends BaseRemoteUsecase<
    BaseResponseEntity<RegistrationContentEntity>, RegisterUseCaseParams> {
  const RegisterUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<RegistrationContentEntity>>> call(
    RegisterUseCaseParams params,
  ) => _repository.register(params);
}
