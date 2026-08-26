// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_statistics_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceStatisticsResponseModel _$MaintenanceStatisticsResponseModelFromJson(
  Map<String, dynamic> json,
) => MaintenanceStatisticsResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : MaintenanceStatisticsModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MaintenanceStatisticsResponseModelToJson(
  MaintenanceStatisticsResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
