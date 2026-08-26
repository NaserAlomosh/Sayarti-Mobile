import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/device/device_platform_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/device_entity.dart';

part 'device_model.g.dart';

@JsonSerializable()
class DeviceModel extends BaseTransformResponseModel<DeviceEntity> {
  const DeviceModel({
    required this.id,
    required this.deviceIdentifier,
    required this.platform,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String deviceIdentifier;
  @JsonKey(fromJson: devicePlatformFromJson, toJson: devicePlatformToJson)
  final DevicePlatform platform;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);

  @override
  DeviceEntity toEntity() => DeviceEntity(
    id: id,
    deviceIdentifier: deviceIdentifier,
    platform: platform,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
