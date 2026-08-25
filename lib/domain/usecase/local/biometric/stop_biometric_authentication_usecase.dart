import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/repository/local/biometric/biometric_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StopBiometricAuthenticationUsecase
    extends BaseLocalUsecase<bool, StopBiometricAuthenticationParams> {
  StopBiometricAuthenticationUsecase(this._biometricRepository);

  final BiometricRepository _biometricRepository;

  @override
  Future<ApiResult<bool>> call(StopBiometricAuthenticationParams params) {
    return _biometricRepository.stopAuthentication();
  }
}

class StopBiometricAuthenticationParams extends BaseUsecaseParams {
  const StopBiometricAuthenticationParams();
}
