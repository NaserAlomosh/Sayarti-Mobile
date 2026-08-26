// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_vehicle_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateVehicleRequestModel _$CreateVehicleRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateVehicleRequestModel(
  brand: json['brand'] as String,
  model: json['model'] as String,
  year: (json['year'] as num).toInt(),
  powertrainType: $enumDecode(_$PowertrainTypeEnumMap, json['powertrainType']),
  currentMileage: (json['currentMileage'] as num).toInt(),
  licensePlate: json['licensePlate'] as String?,
  nickname: json['nickname'] as String?,
  imageUrl: json['imageUrl'] as String?,
  fuelType: $enumDecodeNullable(_$FuelTypeEnumMap, json['fuelType']),
  fuelTankCapacityLiters: (json['fuelTankCapacityLiters'] as num?)?.toDouble(),
  batteryCapacityKwh: (json['batteryCapacityKwh'] as num?)?.toDouble(),
  estimatedRangeKm: (json['estimatedRangeKm'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CreateVehicleRequestModelToJson(
  CreateVehicleRequestModel instance,
) => <String, dynamic>{
  'brand': instance.brand,
  'model': instance.model,
  'year': instance.year,
  'powertrainType': powertrainTypeToJson(instance.powertrainType),
  'currentMileage': instance.currentMileage,
  'licensePlate': instance.licensePlate,
  'nickname': instance.nickname,
  'imageUrl': instance.imageUrl,
  'fuelType': fuelTypeToJson(instance.fuelType),
  'fuelTankCapacityLiters': instance.fuelTankCapacityLiters,
  'batteryCapacityKwh': instance.batteryCapacityKwh,
  'estimatedRangeKm': instance.estimatedRangeKm,
};

const _$PowertrainTypeEnumMap = {
  PowertrainType.gasoline: 'gasoline',
  PowertrainType.diesel: 'diesel',
  PowertrainType.hybrid: 'hybrid',
  PowertrainType.plugInHybrid: 'plugInHybrid',
  PowertrainType.electric: 'electric',
};

const _$FuelTypeEnumMap = {
  FuelType.gasoline90: 'gasoline90',
  FuelType.gasoline95: 'gasoline95',
  FuelType.gasoline98: 'gasoline98',
  FuelType.diesel: 'diesel',
  FuelType.other: 'other',
};
