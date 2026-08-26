import 'package:sayarti_mobile/domain/entity/remote/statistics/currency_statistics_entity.dart';

class GeneralStatisticsEntity {
  const GeneralStatisticsEntity({required this.vehicleId, required this.currentMileage, required this.totalFuelRecords, required this.totalFuelQuantity, required this.totalFuelCostByCurrency, required this.totalMaintenanceRecords, required this.totalMaintenanceCostByCurrency, required this.totalExpenseRecords, required this.totalExpenseAmountByCurrency, required this.activeReminderCount, required this.completedReminderCount});
  final String vehicleId;
  final double currentMileage;
  final int totalFuelRecords;
  final double totalFuelQuantity;
  final List<CurrencyTotalEntity> totalFuelCostByCurrency;
  final int totalMaintenanceRecords;
  final List<CurrencyTotalEntity> totalMaintenanceCostByCurrency;
  final int totalExpenseRecords;
  final List<CurrencyTotalEntity> totalExpenseAmountByCurrency;
  final int activeReminderCount;
  final int completedReminderCount;
}
