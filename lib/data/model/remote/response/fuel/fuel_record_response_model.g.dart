// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'fuel_record_response_model.dart';
FuelRecordResponseModel _$FuelRecordResponseModelFromJson(Map<String, dynamic> json) => FuelRecordResponseModel(success: json['success'] as bool, data: json['data'] == null ? null : FuelRecordModel.fromJson(json['data'] as Map<String, dynamic>), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
Map<String, dynamic> _$FuelRecordResponseModelToJson(FuelRecordResponseModel instance) => <String, dynamic>{'success': instance.success, 'data': instance.data, 'message': instance.message, 'error': instance.error};
