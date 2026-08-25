import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/repository/local/biometric/biometric_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticateBiometricUsecase
    extends BaseLocalUsecase<bool, AuthenticateBiometricUsecaseParams> {
  AuthenticateBiometricUsecase(this._biometricRepository);

  final BiometricRepository _biometricRepository;

  @override
  Future<ApiResult<bool>> call(AuthenticateBiometricUsecaseParams params) {
    return _biometricRepository.authenticate(
      localizedReason: params.localizedReason,
      biometricOnly: params.biometricOnly,
      persistAcrossBackgrounding: params.persistAcrossBackgrounding,
    );
  }
}

class AuthenticateBiometricUsecaseParams extends BaseUsecaseParams {
  const AuthenticateBiometricUsecaseParams({
    required this.localizedReason,
    this.biometricOnly = true,
    this.persistAcrossBackgrounding = true,
  });

  final String localizedReason;
  final bool biometricOnly;
  final bool persistAcrossBackgrounding;
}
