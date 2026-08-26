// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserRequestModel _$UpdateUserRequestModelFromJson(
  Map<String, dynamic> json,
) => UpdateUserRequestModel(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  preferredLanguage: json['preferredLanguage'] as String?,
);

Map<String, dynamic> _$UpdateUserRequestModelToJson(
  UpdateUserRequestModel instance,
) => <String, dynamic>{
  if (instance.firstName case final value?) 'firstName': value,
  if (instance.lastName case final value?) 'lastName': value,
  if (instance.preferredLanguage case final value?)
    'preferredLanguage': value,
};
