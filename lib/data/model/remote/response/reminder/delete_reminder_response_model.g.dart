// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_reminder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteReminderResponseModel _$DeleteReminderResponseModelFromJson(
  Map<String, dynamic> json,
) => DeleteReminderResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : DeleteReminderModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteReminderResponseModelToJson(
  DeleteReminderResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
