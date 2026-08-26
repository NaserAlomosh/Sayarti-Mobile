// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_device_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteDeviceResponseModel _$DeleteDeviceResponseModelFromJson(
  Map<String, dynamic> json,
) => DeleteDeviceResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : DeleteDeviceModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteDeviceResponseModelToJson(
  DeleteDeviceResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
