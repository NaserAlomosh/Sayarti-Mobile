import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_summary_entity.dart';
part 'fuel_summary_model.g.dart';
@JsonSerializable(explicitToJson: true)
class FuelSummaryModel extends BaseTransformResponseModel<FuelSummaryEntity> {
  const FuelSummaryModel({required this.vehicleId, required this.liquidFuelCalculationsSupported, required this.month, required this.totalFuelQuantity, required this.totalDistanceKm, required this.averageFuelEfficiencyKmPerLiter, required this.averageLitersPer100Km, required this.costsByCurrency});
  final String vehicleId; final bool liquidFuelCalculationsSupported; final String month; final double totalFuelQuantity; final double totalDistanceKm; final double? averageFuelEfficiencyKmPerLiter; final double? averageLitersPer100Km; final List<FuelCostSummaryModel> costsByCurrency;
  factory FuelSummaryModel.fromJson(Map<String, dynamic> json) => _$FuelSummaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$FuelSummaryModelToJson(this);
  @override FuelSummaryEntity toEntity() => FuelSummaryEntity(vehicleId: vehicleId, liquidFuelCalculationsSupported: liquidFuelCalculationsSupported, month: month, totalFuelQuantity: totalFuelQuantity, totalDistanceKm: totalDistanceKm, averageFuelEfficiencyKmPerLiter: averageFuelEfficiencyKmPerLiter, averageLitersPer100Km: averageLitersPer100Km, costsByCurrency: costsByCurrency.map((model) => model.toEntity()).toList(growable: false));
}
@JsonSerializable()
class FuelCostSummaryModel extends BaseTransformResponseModel<FuelCostSummaryEntity> {
  const FuelCostSummaryModel({required this.currencyCode, required this.totalFuelCost, required this.monthlyFuelCost, required this.costPerKm});
  final String currencyCode; final double totalFuelCost; final double monthlyFuelCost; final double? costPerKm;
  factory FuelCostSummaryModel.fromJson(Map<String, dynamic> json) => _$FuelCostSummaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$FuelCostSummaryModelToJson(this);
  @override FuelCostSummaryEntity toEntity() => FuelCostSummaryEntity(currencyCode: currencyCode, totalFuelCost: totalFuelCost, monthlyFuelCost: monthlyFuelCost, costPerKm: costPerKm);
}
