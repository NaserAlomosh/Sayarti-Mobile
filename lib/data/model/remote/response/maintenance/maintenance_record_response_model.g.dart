// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_record_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceRecordResponseModel _$MaintenanceRecordResponseModelFromJson(
  Map<String, dynamic> json,
) => MaintenanceRecordResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : MaintenanceRecordModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MaintenanceRecordResponseModelToJson(
  MaintenanceRecordResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
