// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginContentModel _$LoginContentModelFromJson(Map<String, dynamic> json) =>
    LoginContentModel(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenType: json['tokenType'] as String?,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      requiredAction: json['requiredAction'] as String?,
    );

Map<String, dynamic> _$LoginContentModelToJson(LoginContentModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'user': instance.user,
      'requiredAction': instance.requiredAction,
    };
