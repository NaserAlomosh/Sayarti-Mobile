// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailResponseModel _$VerifyEmailResponseModelFromJson(
  Map<String, dynamic> json,
) => VerifyEmailResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : LoginContentModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyEmailResponseModelToJson(
  VerifyEmailResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
