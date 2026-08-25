enum AppBiometricType { face, fingerprint, weak, strong, unknown }

class BiometricEntity {
  const BiometricEntity({
    required this.isDeviceSupported,
    required this.canCheckBiometrics,
    required this.availableBiometrics,
  });

  final bool isDeviceSupported;

  final bool canCheckBiometrics;

  final List<AppBiometricType> availableBiometrics;

  bool get hasEnrolledBiometrics => availableBiometrics.isNotEmpty;

  bool get canAuthenticate =>
      isDeviceSupported && canCheckBiometrics && hasEnrolledBiometrics;

  bool get hasFace => availableBiometrics.contains(AppBiometricType.face);

  bool get hasFingerprint =>
      availableBiometrics.contains(AppBiometricType.fingerprint);

  bool get hasStrongBiometric =>
      availableBiometrics.contains(AppBiometricType.strong);
}
