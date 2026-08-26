// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrenciesResponseModel _$CurrenciesResponseModelFromJson(
  Map<String, dynamic> json,
) => CurrenciesResponseModel(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CurrencyModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CurrenciesResponseModelToJson(
  CurrenciesResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
