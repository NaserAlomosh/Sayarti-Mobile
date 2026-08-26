// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_response_model.dart';

DeviceResponseModel _$DeviceResponseModelFromJson(Map<String, dynamic> json) => DeviceResponseModel(success: json['success'] as bool, data: json['data'] == null ? null : DeviceModel.fromJson(json['data'] as Map<String, dynamic>), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
Map<String, dynamic> _$DeviceResponseModelToJson(DeviceResponseModel instance) => <String, dynamic>{'success': instance.success, 'data': instance.data, 'message': instance.message, 'error': instance.error};
