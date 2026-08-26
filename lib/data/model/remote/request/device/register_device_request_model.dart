import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/model/remote/device/device_platform_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/device_entity.dart';

part 'register_device_request_model.g.dart';

@JsonSerializable()
class RegisterDeviceRequestModel {
  const RegisterDeviceRequestModel({
    required this.deviceIdentifier,
    required this.platform,
    required this.fcmToken,
  });

  final String deviceIdentifier;
  @JsonKey(fromJson: devicePlatformFromJson, toJson: devicePlatformToJson)
  final DevicePlatform platform;
  final String fcmToken;

  factory RegisterDeviceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDeviceRequestModelToJson(this);
}
