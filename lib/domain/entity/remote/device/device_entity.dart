// ignore_for_file: constant_identifier_names

enum DevicePlatform { ANDROID, IOS }

class DeviceEntity {
  const DeviceEntity({
    required this.id,
    required this.deviceIdentifier,
    required this.platform,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String deviceIdentifier;
  final DevicePlatform platform;
  final DateTime createdAt;
  final DateTime updatedAt;
}
