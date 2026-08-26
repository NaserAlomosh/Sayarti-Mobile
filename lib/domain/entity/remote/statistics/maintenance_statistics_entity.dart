import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/currency_statistics_entity.dart';
class MaintenanceStatisticsEntity {
  const MaintenanceStatisticsEntity({required this.vehicleId, required this.totalMaintenanceRecords, required this.totalMaintenanceCostByCurrency, required this.averageMaintenanceCostByCurrency, required this.latestMaintenanceDate, required this.latestMaintenanceMileage, required this.maintenanceByCategory});
  final String vehicleId; final int totalMaintenanceRecords; final List<CurrencyTotalEntity> totalMaintenanceCostByCurrency; final List<CurrencyAverageEntity> averageMaintenanceCostByCurrency; final DateTime? latestMaintenanceDate; final double? latestMaintenanceMileage; final List<MaintenanceCategoryStatisticsEntity> maintenanceByCategory;
}
class MaintenanceCategoryStatisticsEntity {
  const MaintenanceCategoryStatisticsEntity({required this.category, required this.totalMaintenanceRecords, required this.totalMaintenanceCostByCurrency});
  final MaintenanceCategory category; final int totalMaintenanceRecords; final List<CurrencyTotalEntity> totalMaintenanceCostByCurrency;
}
