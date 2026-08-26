import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/currency_statistics_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/general_statistics_entity.dart';

part 'general_statistics_model.g.dart';
@JsonSerializable(explicitToJson: true)
class GeneralStatisticsModel extends BaseTransformResponseModel<GeneralStatisticsEntity> {
 const GeneralStatisticsModel({required this.vehicleId, required this.currentMileage, required this.totalFuelRecords, required this.totalFuelQuantity, required this.totalFuelCostByCurrency, required this.totalMaintenanceRecords, required this.totalMaintenanceCostByCurrency, required this.totalExpenseRecords, required this.totalExpenseAmountByCurrency, required this.activeReminderCount, required this.completedReminderCount}); final String vehicleId; final double currentMileage; final int totalFuelRecords; final double totalFuelQuantity; final List<CurrencyTotalModel> totalFuelCostByCurrency; final int totalMaintenanceRecords; final List<CurrencyTotalModel> totalMaintenanceCostByCurrency; final int totalExpenseRecords; final List<CurrencyTotalModel> totalExpenseAmountByCurrency; final int activeReminderCount; final int completedReminderCount;
 factory GeneralStatisticsModel.fromJson(Map<String,dynamic> json)=>_$GeneralStatisticsModelFromJson(json); Map<String,dynamic> toJson()=>_$GeneralStatisticsModelToJson(this);
 @override GeneralStatisticsEntity toEntity()=>GeneralStatisticsEntity(vehicleId: vehicleId, currentMileage: currentMileage, totalFuelRecords: totalFuelRecords, totalFuelQuantity: totalFuelQuantity, totalFuelCostByCurrency: totalFuelCostByCurrency.map((e)=>e.toEntity()).toList(growable:false), totalMaintenanceRecords: totalMaintenanceRecords, totalMaintenanceCostByCurrency: totalMaintenanceCostByCurrency.map((e)=>e.toEntity()).toList(growable:false), totalExpenseRecords: totalExpenseRecords, totalExpenseAmountByCurrency: totalExpenseAmountByCurrency.map((e)=>e.toEntity()).toList(growable:false), activeReminderCount: activeReminderCount, completedReminderCount: completedReminderCount);
}
