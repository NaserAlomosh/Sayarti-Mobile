enum DeviceInfoErrorType {
  packageInfoFailed,
  androidInfoFailed,
  iosInfoFailed,
  consistentUdidFailed,
  udidFailed,
  deviceIdentifiersFailed,
  jailbreakCheckFailed,
  rootCheckFailed,
  realDeviceCheckFailed,
  vpnCheckFailed,
  debuggableCheckFailed,
  securityCheckFailed,
  manufacturerCheckFailed,
  unknown,
}

class DeviceInfoException implements Exception {
  const DeviceInfoException({
    required this.type,
    required this.messageEn,
    required this.messageAr,
    this.originalError,
    this.stackTrace,
  });

  final DeviceInfoErrorType type;

  final String messageEn;
  final String messageAr;

  final Object? originalError;
  final StackTrace? stackTrace;

  String getMessage({
    required bool isArabic,
  }) {
    return isArabic ? messageAr : messageEn;
  }

  @override
  String toString() {
    return 'DeviceInfoException('
        'type: $type, '
        'message: $messageEn, '
        'originalError: $originalError'
        ')';
  }
}


class DeviceInfoExceptionMapper {
  const DeviceInfoExceptionMapper._();

  static DeviceInfoException packageInfo(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.packageInfoFailed,
      messageEn: 'Unable to retrieve application information.',
      messageAr: 'تعذر الحصول على معلومات التطبيق.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException androidInfo(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.androidInfoFailed,
      messageEn: 'Unable to retrieve Android device information.',
      messageAr: 'تعذر الحصول على معلومات جهاز أندرويد.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException iosInfo(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.iosInfoFailed,
      messageEn: 'Unable to retrieve iOS device information.',
      messageAr: 'تعذر الحصول على معلومات جهاز iOS.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException consistentUdid(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.consistentUdidFailed,
      messageEn: 'Unable to retrieve the consistent device identifier.',
      messageAr: 'تعذر الحصول على معرف الجهاز الثابت.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException udid(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.udidFailed,
      messageEn: 'Unable to retrieve the device identifier.',
      messageAr: 'تعذر الحصول على معرف الجهاز.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException deviceIdentifiers(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.deviceIdentifiersFailed,
      messageEn: 'Unable to retrieve device identifiers.',
      messageAr: 'تعذر الحصول على معرفات الجهاز.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException jailbreak(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.jailbreakCheckFailed,
      messageEn: 'Unable to verify the device jailbreak status.',
      messageAr: 'تعذر التحقق من حالة كسر حماية الجهاز.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException root(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.rootCheckFailed,
      messageEn: 'Unable to verify device root access.',
      messageAr: 'تعذر التحقق من صلاحيات الروت على الجهاز.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException realDevice(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.realDeviceCheckFailed,
      messageEn: 'Unable to verify whether this is a physical device.',
      messageAr: 'تعذر التحقق مما إذا كان الجهاز حقيقياً.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException vpn(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.vpnCheckFailed,
      messageEn: 'Unable to verify the VPN connection status.',
      messageAr: 'تعذر التحقق من حالة اتصال VPN.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException debuggable(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.debuggableCheckFailed,
      messageEn: 'Unable to verify whether the application is debuggable.',
      messageAr: 'تعذر التحقق من حالة تصحيح التطبيق.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException security(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.securityCheckFailed,
      messageEn: 'Unable to complete the device security check.',
      messageAr: 'تعذر إكمال فحص أمان الجهاز.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException manufacturer(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.manufacturerCheckFailed,
      messageEn: 'Unable to retrieve the device manufacturer.',
      messageAr: 'تعذر الحصول على الشركة المصنعة للجهاز.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  static DeviceInfoException unknown(
    Object error,
    StackTrace stackTrace,
  ) {
    return DeviceInfoException(
      type: DeviceInfoErrorType.unknown,
      messageEn: 'An unexpected device information error occurred.',
      messageAr: 'حدث خطأ غير متوقع أثناء قراءة معلومات الجهاز.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }
}