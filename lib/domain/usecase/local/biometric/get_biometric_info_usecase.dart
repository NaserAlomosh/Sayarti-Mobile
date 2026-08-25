import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/local/biometric/biometric_entity.dart';
import 'package:sayarti_mobile/domain/repository/local/biometric/biometric_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBiometricInfoUsecase
    extends BaseLocalUsecase<BiometricEntity, GetBiometricInfoParams> {
  GetBiometricInfoUsecase(this._biometricRepository);

  final BiometricRepository _biometricRepository;

  @override
  Future<ApiResult<BiometricEntity>> call(GetBiometricInfoParams params) {
    return _biometricRepository.getBiometricInfo();
  }
}

class GetBiometricInfoParams extends BaseUsecaseParams {
  const GetBiometricInfoParams();
}
