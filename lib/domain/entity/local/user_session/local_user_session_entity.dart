class LocalUserSessionEntity {
  const LocalUserSessionEntity({
    required this.deviceId,
    required this.username,
  });

  final String? deviceId;
  final String? username;

  bool get hasDeviceId =>
      deviceId != null && deviceId!.trim().isNotEmpty;

  bool get hasUsername =>
      username != null && username!.trim().isNotEmpty;

  bool get isEmpty => !hasDeviceId && !hasUsername;

  bool get isNotEmpty => !isEmpty;
}