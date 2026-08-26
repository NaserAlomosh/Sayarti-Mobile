// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_summary_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuelSummaryResponseModel _$FuelSummaryResponseModelFromJson(
  Map<String, dynamic> json,
) => FuelSummaryResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : FuelSummaryModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FuelSummaryResponseModelToJson(
  FuelSummaryResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
