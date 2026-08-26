// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_vehicle_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteVehicleResponseModel _$DeleteVehicleResponseModelFromJson(
  Map<String, dynamic> json,
) => DeleteVehicleResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : DeleteVehicleModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteVehicleResponseModelToJson(
  DeleteVehicleResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
