// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationContentModel _$RegistrationContentModelFromJson(
  Map<String, dynamic> json,
) => RegistrationContentModel(
  email: json['email'] as String,
  verificationRequired: json['verificationRequired'] as bool,
);

Map<String, dynamic> _$RegistrationContentModelToJson(
  RegistrationContentModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'verificationRequired': instance.verificationRequired,
};
