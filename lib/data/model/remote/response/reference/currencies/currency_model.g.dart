// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      code: json['code'] as String,
      name: json['name'] as String,
      nameEn: json['nameEn'] as String,
      nameAr: json['nameAr'] as String,
      symbol: json['symbol'] as String,
      decimalDigits: (json['decimalDigits'] as num).toInt(),
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'symbol': instance.symbol,
      'decimalDigits': instance.decimalDigits,
    };
