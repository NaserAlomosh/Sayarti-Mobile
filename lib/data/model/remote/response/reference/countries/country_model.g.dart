// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
  code: json['code'] as String,
  nameEn: json['nameEn'] as String,
  nameAr: json['nameAr'] as String,
  defaultCurrencyCode: json['defaultCurrencyCode'] as String,
);

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'defaultCurrencyCode': instance.defaultCurrencyCode,
    };
