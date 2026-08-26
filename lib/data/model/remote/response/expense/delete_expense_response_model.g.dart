// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_expense_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteExpenseResponseModel _$DeleteExpenseResponseModelFromJson(
  Map<String, dynamic> json,
) => DeleteExpenseResponseModel(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : DeleteExpenseModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteExpenseResponseModelToJson(
  DeleteExpenseResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
