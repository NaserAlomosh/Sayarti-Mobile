// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_app_pin_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAppPinRequestModel _$CreateAppPinRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateAppPinRequestModel(
  appPin: json['appPin'] as String,
  confirmAppPin: json['ConfirmAppPin'] as String,
);

Map<String, dynamic> _$CreateAppPinRequestModelToJson(
  CreateAppPinRequestModel instance,
) => <String, dynamic>{
  'appPin': instance.appPin,
  'ConfirmAppPin': instance.confirmAppPin,
};
