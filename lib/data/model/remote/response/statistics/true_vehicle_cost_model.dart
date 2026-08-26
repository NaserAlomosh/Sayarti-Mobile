import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/currency_statistics_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/true_vehicle_cost_entity.dart';

part 'true_vehicle_cost_model.g.dart';
@JsonSerializable(explicitToJson: true)
class TrueVehicleCostModel extends BaseTransformResponseModel<TrueVehicleCostEntity> {
 const TrueVehicleCostModel({required this.vehicleId, required this.currentMileage, required this.totalFuelCostByCurrency, required this.totalMaintenanceCostByCurrency, required this.totalExpenseAmountByCurrency, required this.totalVehicleCostByCurrency, required this.averageMonthlyCostByCurrency, required this.costPerKilometerByCurrency}); final String vehicleId; final double currentMileage; final List<CurrencyTotalModel> totalFuelCostByCurrency; final List<CurrencyTotalModel> totalMaintenanceCostByCurrency; final List<CurrencyTotalModel> totalExpenseAmountByCurrency; final List<CurrencyTotalModel> totalVehicleCostByCurrency; final List<CurrencyAverageModel> averageMonthlyCostByCurrency; final List<CurrencyRateModel> costPerKilometerByCurrency;
 factory TrueVehicleCostModel.fromJson(Map<String,dynamic> json)=>_$TrueVehicleCostModelFromJson(json); Map<String,dynamic> toJson()=>_$TrueVehicleCostModelToJson(this);
 @override TrueVehicleCostEntity toEntity()=>TrueVehicleCostEntity(vehicleId: vehicleId, currentMileage: currentMileage, totalFuelCostByCurrency: totalFuelCostByCurrency.map((e)=>e.toEntity()).toList(growable:false), totalMaintenanceCostByCurrency: totalMaintenanceCostByCurrency.map((e)=>e.toEntity()).toList(growable:false), totalExpenseAmountByCurrency: totalExpenseAmountByCurrency.map((e)=>e.toEntity()).toList(growable:false), totalVehicleCostByCurrency: totalVehicleCostByCurrency.map((e)=>e.toEntity()).toList(growable:false), averageMonthlyCostByCurrency: averageMonthlyCostByCurrency.map((e)=>e.toEntity()).toList(growable:false), costPerKilometerByCurrency: costPerKilometerByCurrency.map((e)=>e.toEntity()).toList(growable:false));
}
