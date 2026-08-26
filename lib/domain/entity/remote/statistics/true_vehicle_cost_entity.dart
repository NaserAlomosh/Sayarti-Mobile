import 'package:sayarti_mobile/domain/entity/remote/statistics/currency_statistics_entity.dart';
class TrueVehicleCostEntity {
  const TrueVehicleCostEntity({required this.vehicleId, required this.currentMileage, required this.totalFuelCostByCurrency, required this.totalMaintenanceCostByCurrency, required this.totalExpenseAmountByCurrency, required this.totalVehicleCostByCurrency, required this.averageMonthlyCostByCurrency, required this.costPerKilometerByCurrency});
  final String vehicleId; final double currentMileage; final List<CurrencyTotalEntity> totalFuelCostByCurrency; final List<CurrencyTotalEntity> totalMaintenanceCostByCurrency; final List<CurrencyTotalEntity> totalExpenseAmountByCurrency; final List<CurrencyTotalEntity> totalVehicleCostByCurrency; final List<CurrencyAverageEntity> averageMonthlyCostByCurrency; final List<CurrencyRateEntity> costPerKilometerByCurrency;
}
