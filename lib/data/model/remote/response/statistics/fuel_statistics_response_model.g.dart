// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'fuel_statistics_response_model.dart';
FuelStatisticsResponseModel _$FuelStatisticsResponseModelFromJson(Map<String, dynamic> json) => FuelStatisticsResponseModel(success: json['success'] as bool, data: json['data'] == null ? null : FuelStatisticsModel.fromJson(json['data'] as Map<String, dynamic>), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
Map<String, dynamic> _$FuelStatisticsResponseModelToJson(FuelStatisticsResponseModel instance) => <String, dynamic>{'success': instance.success, 'data': instance.data, 'message': instance.message, 'error': instance.error};
