// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  emailVerified: json['emailVerified'] as bool?,
  authProvider: json['authProvider'] as String?,
  countryCode: json['countryCode'] as String?,
  defaultCurrencyCode: json['defaultCurrencyCode'] as String?,
  preferredLanguage: json['preferredLanguage'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'emailVerified': instance.emailVerified,
  'authProvider': instance.authProvider,
  'countryCode': instance.countryCode,
  'defaultCurrencyCode': instance.defaultCurrencyCode,
  'preferredLanguage': instance.preferredLanguage,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
