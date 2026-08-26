// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceRequestModel _$RegisterDeviceRequestModelFromJson(
  Map<String, dynamic> json,
) => RegisterDeviceRequestModel(
  deviceIdentifier: json['deviceIdentifier'] as String,
  platform: devicePlatformFromJson(json['platform'] as String),
  fcmToken: json['fcmToken'] as String,
);

Map<String, dynamic> _$RegisterDeviceRequestModelToJson(
  RegisterDeviceRequestModel instance,
) => <String, dynamic>{
  'deviceIdentifier': instance.deviceIdentifier,
  'platform': devicePlatformToJson(instance.platform),
  'fcmToken': instance.fcmToken,
};
