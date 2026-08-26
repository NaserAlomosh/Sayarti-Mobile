// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'delete_fuel_record_response_model.dart';
DeleteFuelRecordResponseModel _$DeleteFuelRecordResponseModelFromJson(Map<String, dynamic> json) => DeleteFuelRecordResponseModel(success: json['success'] as bool, data: json['data'] == null ? null : DeleteFuelRecordModel.fromJson(json['data'] as Map<String, dynamic>), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
Map<String, dynamic> _$DeleteFuelRecordResponseModelToJson(DeleteFuelRecordResponseModel instance) => <String, dynamic>{'success': instance.success, 'data': instance.data, 'message': instance.message, 'error': instance.error};
