// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_app_version_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentAppVersionRequestModel _$CurrentAppVersionRequestModelFromJson(
  Map<String, dynamic> json,
) => CurrentAppVersionRequestModel(
  parentVersion: json['parentVersion'] as String?,
  version: json['version'] as String?,
  platform: json['platform'] as String?,
);

Map<String, dynamic> _$CurrentAppVersionRequestModelToJson(
  CurrentAppVersionRequestModel instance,
) => <String, dynamic>{
  'parentVersion': instance.parentVersion,
  'version': instance.version,
  'platform': instance.platform,
};
