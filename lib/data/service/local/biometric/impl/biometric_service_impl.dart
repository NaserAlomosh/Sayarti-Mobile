import 'package:sayarti_mobile/data/service/local/biometric/biometric_service.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@LazySingleton(as: BiometricService)
class BiometricServiceImpl implements BiometricService {
  BiometricServiceImpl(this._localAuthentication);

  final LocalAuthentication _localAuthentication;

  @override
  Future<bool> isDeviceSupported() {
    return _localAuthentication.isDeviceSupported();
  }

  @override
  Future<bool> canCheckBiometrics() {
    return _localAuthentication.canCheckBiometrics;
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() {
    return _localAuthentication.getAvailableBiometrics();
  }

  @override
  Future<bool> authenticate({
    required String localizedReason,
    bool biometricOnly = true,
    bool persistAcrossBackgrounding = true,
  }) {
    return _localAuthentication.authenticate(
      localizedReason: localizedReason,
      biometricOnly: biometricOnly,
      persistAcrossBackgrounding: persistAcrossBackgrounding,
    );
  }

  @override
  Future<bool> stopAuthentication() {
    return _localAuthentication.stopAuthentication();
  }
}
