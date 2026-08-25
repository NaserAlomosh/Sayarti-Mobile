import 'package:local_auth/local_auth.dart';

import 'package:sayarti_mobile/data/networking/error/app_error.dart';

enum BiometricErrorType {
  notAvailable,
  notEnrolled,
  lockedOut,
  permanentlyLockedOut,
  passcodeNotSet,
  canceled,
  temporarilyUnavailable,
  unknown,
}

class BiometricException implements Exception {
  const BiometricException({
    required this.type,
    required this.messageEn,
    required this.messageAr,
    this.originalError,
  });

  final BiometricErrorType type;
  final String messageEn;
  final String messageAr;
  final Object? originalError;

  String getMessage({
    required bool isArabic,
  }) {
    return isArabic ? messageAr : messageEn;
  }

  static ApiErrorModel fromLocalAuthException(
    LocalAuthException error, {
    required bool isArabic,
  }) {
    final exception = _mapLocalAuthException(error);

    return ApiErrorModel(
      message: exception.getMessage(
        isArabic: isArabic,
      ),
      code: _codeFromType(exception.type),
      originalError: error,
    );
  }

  static BiometricException _mapLocalAuthException(
    LocalAuthException error,
  ) {
    switch (error.code) {
      case LocalAuthExceptionCode.noBiometricHardware:
        return BiometricException(
          type: BiometricErrorType.notAvailable,
          messageEn:
              'Biometric authentication is not supported on this device.',
          messageAr:
              'المصادقة باستخدام البصمة غير مدعومة على هذا الجهاز.',
          originalError: error,
        );

      case LocalAuthExceptionCode.noBiometricsEnrolled:
        return BiometricException(
          type: BiometricErrorType.notEnrolled,
          messageEn:
              'No biometrics are enrolled. Please set up Face ID or fingerprint in your device settings.',
          messageAr:
              'لم يتم إعداد البصمة على جهازك. يرجى إعداد بصمة الوجه أو بصمة الإصبع من إعدادات الجهاز.',
          originalError: error,
        );

      case LocalAuthExceptionCode.temporaryLockout:
        return BiometricException(
          type: BiometricErrorType.lockedOut,
          messageEn:
              'Biometric authentication is temporarily locked. Please try again later.',
          messageAr:
              'تم إيقاف المصادقة باستخدام البصمة مؤقتاً. يرجى المحاولة لاحقاً.',
          originalError: error,
        );

      case LocalAuthExceptionCode.biometricLockout:
        return BiometricException(
          type: BiometricErrorType.permanentlyLockedOut,
          messageEn:
              'Biometric authentication is locked. Please unlock your device using your passcode and try again.',
          messageAr:
              'تم إيقاف المصادقة باستخدام البصمة. يرجى فتح الجهاز باستخدام رمز القفل ثم المحاولة مرة أخرى.',
          originalError: error,
        );

      case LocalAuthExceptionCode.noCredentialsSet:
        return BiometricException(
          type: BiometricErrorType.passcodeNotSet,
          messageEn:
              'Please set a device passcode before using biometric authentication.',
          messageAr:
              'يرجى إعداد رمز قفل للجهاز قبل استخدام المصادقة باستخدام البصمة.',
          originalError: error,
        );

      case LocalAuthExceptionCode.userCanceled:
      case LocalAuthExceptionCode.systemCanceled:
        return BiometricException(
          type: BiometricErrorType.canceled,
          messageEn: 'Biometric authentication was canceled.',
          messageAr: 'تم إلغاء المصادقة باستخدام البصمة.',
          originalError: error,
        );

      default:
        return BiometricException(
          type: BiometricErrorType.unknown,
          messageEn:
              'Biometric authentication failed. Please try again.',
          messageAr:
              'فشلت عملية التحقق باستخدام البصمة. يرجى المحاولة مرة أخرى.',
          originalError: error,
        );
    }
  }

  static String _codeFromType(BiometricErrorType type) {
    return switch (type) {
      BiometricErrorType.notAvailable => 'BIOMETRIC_NOT_AVAILABLE',
      BiometricErrorType.notEnrolled => 'BIOMETRIC_NOT_ENROLLED',
      BiometricErrorType.lockedOut => 'BIOMETRIC_LOCKED_OUT',
      BiometricErrorType.permanentlyLockedOut =>
        'BIOMETRIC_PERMANENTLY_LOCKED_OUT',
      BiometricErrorType.passcodeNotSet => 'DEVICE_PASSCODE_NOT_SET',
      BiometricErrorType.canceled => 'BIOMETRIC_CANCELED',
      BiometricErrorType.temporarilyUnavailable =>
        'BIOMETRIC_TEMPORARILY_UNAVAILABLE',
      BiometricErrorType.unknown => 'BIOMETRIC_UNKNOWN',
    };
  }

  @override
  String toString() {
    return 'BiometricException('
        'type: $type, '
        'message: $messageEn, '
        'originalError: $originalError'
        ')';
  }
}