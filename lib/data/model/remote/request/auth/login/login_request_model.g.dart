// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      userName: json['userName'] as String,
      password: json['password'] as String,
      loginType: json['loginType'] as String,
      cipher: json['cipher'] as String?,
      appLoginPin: json['appLoginPin'] as String?,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'loginType': instance.loginType,
      'cipher': instance.cipher,
      'appLoginPin': instance.appLoginPin,
    };
