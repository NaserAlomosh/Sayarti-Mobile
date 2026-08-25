import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/local/device/device_info_entity.dart';

class DeviceInfoModel extends BaseTransformResponseModel<DeviceInfoEntity> {
  const DeviceInfoModel({
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

  final String ip;
  final String consistentDeviceId;
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

  @override
  DeviceInfoEntity toEntity() {
    return DeviceInfoEntity(
      channelId: channelId,
      bankId: bankId,
      countryCode: countryCode,
      ip: ip,
      consistentDeviceId: consistentDeviceId,
      deviceId: deviceId,
      latitude: latitude,
      longitude: longitude,
      platform: platform,
      mobileModel: mobileModel,
      appVersion: appVersion,
      buildNumber: buildNumber,
      osVersion: osVersion,
      language: language,
    );
  }

  // to Jsonn
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
