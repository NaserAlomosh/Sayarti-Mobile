// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'vehicle_response_model.dart';
VehicleResponseModel _$VehicleResponseModelFromJson(Map<String, dynamic> json) => VehicleResponseModel(success: json['success'] as bool, data: json['data'] == null ? null : VehicleModel.fromJson(json['data'] as Map<String, dynamic>), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
Map<String, dynamic> _$VehicleResponseModelToJson(VehicleResponseModel instance) => <String, dynamic>{'success': instance.success, 'data': instance.data, 'message': instance.message, 'error': instance.error};
