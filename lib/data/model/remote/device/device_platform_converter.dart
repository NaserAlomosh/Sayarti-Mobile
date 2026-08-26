import 'package:sayarti_mobile/domain/entity/remote/device/device_entity.dart';

DevicePlatform devicePlatformFromJson(String value) => switch (value) {
  'ANDROID' => DevicePlatform.ANDROID,
  'IOS' => DevicePlatform.IOS,
  _ => throw FormatException('Unknown device platform: $value'),
};

String devicePlatformToJson(DevicePlatform value) => switch (value) {
  DevicePlatform.ANDROID => 'ANDROID',
  DevicePlatform.IOS => 'IOS',
};
