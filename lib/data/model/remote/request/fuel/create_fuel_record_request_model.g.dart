// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_fuel_record_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFuelRecordRequestModel _$CreateFuelRecordRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateFuelRecordRequestModel(
  odometerKm: (json['odometerKm'] as num).toDouble(),
  quantityLiters: (json['quantityLiters'] as num).toDouble(),
  pricePerLiter: (json['pricePerLiter'] as num).toDouble(),
  currencyCode: json['currencyCode'] as String?,
  filledAt: DateTime.parse(json['filledAt'] as String),
  fullTank: json['fullTank'] as bool,
  stationName: json['stationName'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateFuelRecordRequestModelToJson(
  CreateFuelRecordRequestModel instance,
) => <String, dynamic>{
  'odometerKm': instance.odometerKm,
  'quantityLiters': instance.quantityLiters,
  'pricePerLiter': instance.pricePerLiter,
  'currencyCode': ?instance.currencyCode,
  'filledAt': instance.filledAt.toIso8601String(),
  'fullTank': instance.fullTank,
  'stationName': ?instance.stationName,
  'notes': ?instance.notes,
};
