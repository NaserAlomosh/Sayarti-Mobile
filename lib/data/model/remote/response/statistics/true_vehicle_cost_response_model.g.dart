// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'true_vehicle_cost_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrueVehicleCostResponseModel _$TrueVehicleCostResponseModelFromJson(
  Map<String, dynamic> json,
) => TrueVehicleCostResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : TrueVehicleCostModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TrueVehicleCostResponseModelToJson(
  TrueVehicleCostResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
