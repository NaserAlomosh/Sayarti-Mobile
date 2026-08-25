import 'package:local_auth/local_auth.dart';

abstract class BiometricService {
  Future<bool> isDeviceSupported();

  Future<bool> canCheckBiometrics();

  Future<List<BiometricType>> getAvailableBiometrics();

  Future<bool> authenticate({
    required String localizedReason,
    bool biometricOnly = true,
    bool persistAcrossBackgrounding = true,
  });

  Future<bool> stopAuthentication();
}