// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'true_vehicle_cost_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrueVehicleCostModel _$TrueVehicleCostModelFromJson(
  Map<String, dynamic> json,
) => TrueVehicleCostModel(
  vehicleId: json['vehicleId'] as String,
  currentMileage: (json['currentMileage'] as num).toDouble(),
  totalFuelCostByCurrency: (json['totalFuelCostByCurrency'] as List<dynamic>)
      .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalMaintenanceCostByCurrency:
      (json['totalMaintenanceCostByCurrency'] as List<dynamic>)
          .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalExpenseAmountByCurrency:
      (json['totalExpenseAmountByCurrency'] as List<dynamic>)
          .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalVehicleCostByCurrency:
      (json['totalVehicleCostByCurrency'] as List<dynamic>)
          .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  averageMonthlyCostByCurrency:
      (json['averageMonthlyCostByCurrency'] as List<dynamic>)
          .map((e) => CurrencyAverageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  costPerKilometerByCurrency:
      (json['costPerKilometerByCurrency'] as List<dynamic>)
          .map((e) => CurrencyRateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$TrueVehicleCostModelToJson(
  TrueVehicleCostModel instance,
) => <String, dynamic>{
  'vehicleId': instance.vehicleId,
  'currentMileage': instance.currentMileage,
  'totalFuelCostByCurrency': instance.totalFuelCostByCurrency
      .map((e) => e.toJson())
      .toList(),
  'totalMaintenanceCostByCurrency': instance.totalMaintenanceCostByCurrency
      .map((e) => e.toJson())
      .toList(),
  'totalExpenseAmountByCurrency': instance.totalExpenseAmountByCurrency
      .map((e) => e.toJson())
      .toList(),
  'totalVehicleCostByCurrency': instance.totalVehicleCostByCurrency
      .map((e) => e.toJson())
      .toList(),
  'averageMonthlyCostByCurrency': instance.averageMonthlyCostByCurrency
      .map((e) => e.toJson())
      .toList(),
  'costPerKilometerByCurrency': instance.costPerKilometerByCurrency
      .map((e) => e.toJson())
      .toList(),
};
