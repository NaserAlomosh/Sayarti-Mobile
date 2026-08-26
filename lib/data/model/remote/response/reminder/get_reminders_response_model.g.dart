// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reminders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRemindersResponseModel _$GetRemindersResponseModelFromJson(
  Map<String, dynamic> json,
) => GetRemindersResponseModel(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ReminderModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetRemindersResponseModelToJson(
  GetRemindersResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
