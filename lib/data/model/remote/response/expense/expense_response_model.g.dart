// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseResponseModel _$ExpenseResponseModelFromJson(
  Map<String, dynamic> json,
) => ExpenseResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : ExpenseModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ExpenseResponseModelToJson(
  ExpenseResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
