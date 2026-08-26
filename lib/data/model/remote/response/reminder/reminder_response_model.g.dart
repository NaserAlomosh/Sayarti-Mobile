// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_response_model.dart';

ReminderResponseModel _$ReminderResponseModelFromJson(Map<String, dynamic> json) => ReminderResponseModel(success: json['success'] as bool, data: json['data'] == null ? null : ReminderModel.fromJson(json['data'] as Map<String, dynamic>), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
Map<String, dynamic> _$ReminderResponseModelToJson(ReminderResponseModel instance) => <String, dynamic>{'success': instance.success, 'data': instance.data, 'message': instance.message, 'error': instance.error};
