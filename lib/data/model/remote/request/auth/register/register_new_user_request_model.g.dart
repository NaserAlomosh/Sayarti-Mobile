// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_new_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterNewUserRequestModel _$RegisterNewUserRequestModelFromJson(
  Map<String, dynamic> json,
) => RegisterNewUserRequestModel(
  mobileNumber: json['mobileNumber'] as String,
  email: json['email'] as String,
  userName: json['userName'] as String,
  newPassword: json['newPassword'] as String,
  reEnterPassword: json['ReEnterPassword'] as String,
);

Map<String, dynamic> _$RegisterNewUserRequestModelToJson(
  RegisterNewUserRequestModel instance,
) => <String, dynamic>{
  'mobileNumber': instance.mobileNumber,
  'email': instance.email,
  'userName': instance.userName,
  'newPassword': instance.newPassword,
  'ReEnterPassword': instance.reEnterPassword,
};
