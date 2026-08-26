// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vehicle_activity_response_model.dart';

GetVehicleActivityResponseModel _$GetVehicleActivityResponseModelFromJson(Map<String, dynamic> json) => GetVehicleActivityResponseModel(success: json['success'] as bool, data: (json['data'] as List<dynamic>?)?.map((e) => VehicleActivityModel.fromJson(e as Map<String, dynamic>)).toList(), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
Map<String, dynamic> _$GetVehicleActivityResponseModelToJson(GetVehicleActivityResponseModel instance) => <String, dynamic>{'success': instance.success, 'data': instance.data, 'message': instance.message, 'error': instance.error};
