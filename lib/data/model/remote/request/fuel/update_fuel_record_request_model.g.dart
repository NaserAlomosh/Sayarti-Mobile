// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_fuel_record_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFuelRecordRequestModel _$UpdateFuelRecordRequestModelFromJson(
  Map<String, dynamic> json,
) => UpdateFuelRecordRequestModel(
  quantityLiters: (json['quantityLiters'] as num?)?.toDouble(),
  pricePerLiter: (json['pricePerLiter'] as num?)?.toDouble(),
  currencyCode: json['currencyCode'] as String?,
  filledAt: json['filledAt'] == null
      ? null
      : DateTime.parse(json['filledAt'] as String),
  fullTank: json['fullTank'] as bool?,
  stationName: json['stationName'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$UpdateFuelRecordRequestModelToJson(
  UpdateFuelRecordRequestModel instance,
) => <String, dynamic>{
  'quantityLiters': ?instance.quantityLiters,
  'pricePerLiter': ?instance.pricePerLiter,
  'currencyCode': ?instance.currencyCode,
  'filledAt': ?instance.filledAt?.toIso8601String(),
  'fullTank': ?instance.fullTank,
  'stationName': ?instance.stationName,
  'notes': ?instance.notes,
};
