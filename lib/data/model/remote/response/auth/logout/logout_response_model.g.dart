// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponseModel _$LogoutResponseModelFromJson(Map<String, dynamic> json) =>
    LogoutResponseModel(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : LogoutModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] == null
          ? null
          : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogoutResponseModelToJson(
  LogoutResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
