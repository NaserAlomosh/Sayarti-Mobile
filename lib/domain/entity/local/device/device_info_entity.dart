class DeviceInfoEntity {
  const DeviceInfoEntity({
    required this.channelId,
    required this.bankId,
    required this.countryCode,
    required this.ip,
    required this.consistentDeviceId,
    required this.deviceId,
    required this.latitude,
    required this.longitude,
    required this.platform,
    required this.mobileModel,
    required this.appVersion,
    required this.buildNumber,
    required this.osVersion,
    required this.language,
  });

  final String channelId;
  final String bankId;
  final String countryCode;

  /// Device IP address.
  final String ip;

  /// Stable device identifier used as DeviceID header.
  final String consistentDeviceId;

  /// Platform UDID.
  final String deviceId;

  final String latitude;
  final String longitude;

  final String platform;
  final String mobileModel;

  final String appVersion;
  final String buildNumber;
  final String osVersion;

  final String language;

  String get fullAppVersion => '$appVersion $buildNumber';

  Map<String, dynamic> toJson() {
    return {
      'channelId': channelId,
      'bankId': bankId,
      'countryCode': countryCode,
      'ip': ip,
      'consistentDeviceId': consistentDeviceId,
      'deviceId': deviceId,
      'latitude': latitude,
      'longitude': longitude,
      'platform': platform,
      'mobileModel': mobileModel,
      'appVersion': appVersion,
      'buildNumber': buildNumber,
      'osVersion': osVersion,
      'language': language,
    };
  }
}
