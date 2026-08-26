// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserResponseModel _$DeleteUserResponseModelFromJson(
  Map<String, dynamic> json,
) => DeleteUserResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : DeleteUserModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteUserResponseModelToJson(
  DeleteUserResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
