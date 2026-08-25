import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_local_request.dart';
import 'package:sayarti_mobile/data/service/local/biometric/biometric_service.dart';
import 'package:sayarti_mobile/domain/entity/local/biometric/biometric_entity.dart';
import 'package:sayarti_mobile/domain/repository/local/biometric/biometric_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@LazySingleton(as: BiometricRepository)
class BiometricRepositoryImpl implements BiometricRepository {
  BiometricRepositoryImpl(this._biometricService);

  final BiometricService _biometricService;

  @override
  Future<ApiResult<BiometricEntity>> getBiometricInfo() {
    return SafeLocalRequest.execute<BiometricEntity>(
      request: () async {
        final isDeviceSupported = await _biometricService.isDeviceSupported();

        final canCheckBiometrics = await _biometricService.canCheckBiometrics();

        final availableBiometrics = await _biometricService
            .getAvailableBiometrics();

        return BiometricEntity(
          isDeviceSupported: isDeviceSupported,
          canCheckBiometrics: canCheckBiometrics,
          availableBiometrics: availableBiometrics
              .map(_mapBiometricType)
              .toList(growable: false),
        );
      },
    );
  }

  @override
  Future<ApiResult<bool>> authenticate({
    required String localizedReason,
    bool biometricOnly = true,
    bool persistAcrossBackgrounding = true,
  }) {
    return SafeLocalRequest.execute<bool>(
      request: () {
        return _biometricService.authenticate(
          localizedReason: localizedReason,
          biometricOnly: biometricOnly,
          persistAcrossBackgrounding: persistAcrossBackgrounding,
        );
      },
    );
  }

  @override
  Future<ApiResult<bool>> stopAuthentication() {
    return SafeLocalRequest.execute<bool>(
      request: _biometricService.stopAuthentication,
    );
  }

  AppBiometricType _mapBiometricType(BiometricType type) {
    return switch (type) {
      BiometricType.face => AppBiometricType.face,
      BiometricType.fingerprint => AppBiometricType.fingerprint,
      BiometricType.weak => AppBiometricType.weak,
      BiometricType.strong => AppBiometricType.strong,
      _ => AppBiometricType.unknown,
    };
  }
}
