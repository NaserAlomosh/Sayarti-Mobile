import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/currency_statistics_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/fuel_statistics_entity.dart';

part 'fuel_statistics_model.g.dart';
@JsonSerializable(explicitToJson: true)
class FuelStatisticsModel extends BaseTransformResponseModel<FuelStatisticsEntity> {
 const FuelStatisticsModel({required this.vehicleId, required this.totalFuelRecords, required this.totalFuelQuantity, required this.totalFuelCostByCurrency, required this.totalDistanceKm, required this.averageFuelEfficiencyKmPerLiter, required this.averageFuelConsumptionLitersPer100Km, required this.averageFuelCostPerKmByCurrency}); final String vehicleId; final int totalFuelRecords; final double totalFuelQuantity; final List<CurrencyTotalModel> totalFuelCostByCurrency; final double totalDistanceKm; final double? averageFuelEfficiencyKmPerLiter; final double? averageFuelConsumptionLitersPer100Km; final List<CurrencyRateModel> averageFuelCostPerKmByCurrency;
 factory FuelStatisticsModel.fromJson(Map<String,dynamic> json)=>_$FuelStatisticsModelFromJson(json); Map<String,dynamic> toJson()=>_$FuelStatisticsModelToJson(this);
 @override FuelStatisticsEntity toEntity()=>FuelStatisticsEntity(vehicleId: vehicleId, totalFuelRecords: totalFuelRecords, totalFuelQuantity: totalFuelQuantity, totalFuelCostByCurrency: totalFuelCostByCurrency.map((e)=>e.toEntity()).toList(growable:false), totalDistanceKm: totalDistanceKm, averageFuelEfficiencyKmPerLiter: averageFuelEfficiencyKmPerLiter, averageFuelConsumptionLitersPer100Km: averageFuelConsumptionLitersPer100Km, averageFuelCostPerKmByCurrency: averageFuelCostPerKmByCurrency.map((e)=>e.toEntity()).toList(growable:false));
}
