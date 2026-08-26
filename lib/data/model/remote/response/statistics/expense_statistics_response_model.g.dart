// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'expense_statistics_response_model.dart';
ExpenseStatisticsResponseModel _$ExpenseStatisticsResponseModelFromJson(Map<String, dynamic> json) => ExpenseStatisticsResponseModel(success: json['success'] as bool, data: json['data'] == null ? null : ExpenseStatisticsModel.fromJson(json['data'] as Map<String, dynamic>), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
Map<String, dynamic> _$ExpenseStatisticsResponseModelToJson(ExpenseStatisticsResponseModel instance) => <String, dynamic>{'success': instance.success, 'data': instance.data, 'message': instance.message, 'error': instance.error};
