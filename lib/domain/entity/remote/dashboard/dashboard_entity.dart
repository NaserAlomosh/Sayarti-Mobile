import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/currency_statistics_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';

class DashboardEntity {
  const DashboardEntity({
    required this.vehicleId,
    required this.vehicle,
    required this.currentMileage,
    required this.fuel,
    required this.maintenance,
    required this.expenses,
    required this.totalVehicleCost,
    required this.reminders,
  });

  final String vehicleId;
  final VehicleEntity vehicle;
  final int currentMileage;
  final DashboardFuelSummaryEntity fuel;
  final DashboardMaintenanceSummaryEntity maintenance;
  final DashboardExpenseSummaryEntity expenses;
  final DashboardTotalCostSummaryEntity totalVehicleCost;
  final DashboardReminderSummaryEntity reminders;
}

class DashboardFuelSummaryEntity {
  const DashboardFuelSummaryEntity({
    required this.totalRecords,
    required this.totalQuantityLiters,
    required this.costsByCurrency,
    required this.averageKmPerLiter,
    required this.averageLitersPer100Km,
  });

  final int totalRecords;
  final double totalQuantityLiters;
  final List<CurrencyTotalEntity> costsByCurrency;
  final double? averageKmPerLiter;
  final double? averageLitersPer100Km;
}

class DashboardMaintenanceSummaryEntity {
  const DashboardMaintenanceSummaryEntity({
    required this.totalRecords,
    required this.latestMaintenanceDate,
    required this.costsByCurrency,
  });

  final int totalRecords;
  final DateTime? latestMaintenanceDate;
  final List<CurrencyTotalEntity> costsByCurrency;
}

class DashboardExpenseSummaryEntity {
  const DashboardExpenseSummaryEntity({
    required this.totalRecords,
    required this.costsByCurrency,
  });

  final int totalRecords;
  final List<CurrencyTotalEntity> costsByCurrency;
}

class DashboardTotalCostSummaryEntity {
  const DashboardTotalCostSummaryEntity({
    required this.costsByCurrency,
    required this.averageMonthlyCostsByCurrency,
    required this.costsPerKilometerByCurrency,
  });

  final List<CurrencyTotalEntity> costsByCurrency;
  final List<CurrencyAverageEntity> averageMonthlyCostsByCurrency;
  final List<CurrencyRateEntity> costsPerKilometerByCurrency;
}

class DashboardReminderSummaryEntity {
  const DashboardReminderSummaryEntity({
    required this.activeCount,
    required this.completedCount,
    required this.nearestUpcoming,
  });

  final int activeCount;
  final int completedCount;
  final ReminderEntity? nearestUpcoming;
}
