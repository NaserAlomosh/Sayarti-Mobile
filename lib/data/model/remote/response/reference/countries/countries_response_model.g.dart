// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesResponseModel _$CountriesResponseModelFromJson(
  Map<String, dynamic> json,
) => CountriesResponseModel(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CountriesResponseModelToJson(
  CountriesResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
};
