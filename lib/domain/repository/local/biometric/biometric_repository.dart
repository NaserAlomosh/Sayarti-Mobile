import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/entity/local/biometric/biometric_entity.dart';

abstract class BiometricRepository {
  Future<ApiResult<BiometricEntity>> getBiometricInfo();

  Future<ApiResult<bool>> authenticate({
    required String localizedReason,
    bool biometricOnly = true,
    bool persistAcrossBackgrounding = true,
  });

  Future<ApiResult<bool>> stopAuthentication();
}
