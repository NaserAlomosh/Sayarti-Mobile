import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reminder/reminder_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/currency_statistics_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/vehicle/vehicle_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/dashboard/dashboard_entity.dart';

part 'dashboard_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DashboardModel extends BaseTransformResponseModel<DashboardEntity> {
  const DashboardModel({
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
  final VehicleModel vehicle;
  final int currentMileage;
  final DashboardFuelSummaryModel fuel;
  final DashboardMaintenanceSummaryModel maintenance;
  final DashboardExpenseSummaryModel expenses;
  final DashboardTotalCostSummaryModel totalVehicleCost;
  final DashboardReminderSummaryModel reminders;

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

  @override
  DashboardEntity toEntity() => DashboardEntity(
    vehicleId: vehicleId,
    vehicle: vehicle.toEntity(),
    currentMileage: currentMileage,
    fuel: fuel.toEntity(),
    maintenance: maintenance.toEntity(),
    expenses: expenses.toEntity(),
    totalVehicleCost: totalVehicleCost.toEntity(),
    reminders: reminders.toEntity(),
  );
}

@JsonSerializable(explicitToJson: true)
class DashboardFuelSummaryModel
    extends BaseTransformResponseModel<DashboardFuelSummaryEntity> {
  const DashboardFuelSummaryModel({
    required this.totalRecords,
    required this.totalQuantityLiters,
    required this.costsByCurrency,
    required this.averageKmPerLiter,
    required this.averageLitersPer100Km,
  });

  final int totalRecords;
  final double totalQuantityLiters;
  final List<CurrencyTotalModel> costsByCurrency;
  final double? averageKmPerLiter;
  final double? averageLitersPer100Km;

  factory DashboardFuelSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardFuelSummaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardFuelSummaryModelToJson(this);

  @override
  DashboardFuelSummaryEntity toEntity() => DashboardFuelSummaryEntity(
    totalRecords: totalRecords,
    totalQuantityLiters: totalQuantityLiters,
    costsByCurrency: costsByCurrency
        .map((model) => model.toEntity())
        .toList(growable: false),
    averageKmPerLiter: averageKmPerLiter,
    averageLitersPer100Km: averageLitersPer100Km,
  );
}

@JsonSerializable(explicitToJson: true)
class DashboardMaintenanceSummaryModel
    extends BaseTransformResponseModel<DashboardMaintenanceSummaryEntity> {
  const DashboardMaintenanceSummaryModel({
    required this.totalRecords,
    required this.latestMaintenanceDate,
    required this.costsByCurrency,
  });

  final int totalRecords;
  final DateTime? latestMaintenanceDate;
  final List<CurrencyTotalModel> costsByCurrency;

  factory DashboardMaintenanceSummaryModel.fromJson(
    Map<String, dynamic> json,
  ) => _$DashboardMaintenanceSummaryModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$DashboardMaintenanceSummaryModelToJson(this);

  @override
  DashboardMaintenanceSummaryEntity toEntity() =>
      DashboardMaintenanceSummaryEntity(
        totalRecords: totalRecords,
        latestMaintenanceDate: latestMaintenanceDate,
        costsByCurrency: costsByCurrency
            .map((model) => model.toEntity())
            .toList(growable: false),
      );
}

@JsonSerializable(explicitToJson: true)
class DashboardExpenseSummaryModel
    extends BaseTransformResponseModel<DashboardExpenseSummaryEntity> {
  const DashboardExpenseSummaryModel({
    required this.totalRecords,
    required this.costsByCurrency,
  });

  final int totalRecords;
  final List<CurrencyTotalModel> costsByCurrency;

  factory DashboardExpenseSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardExpenseSummaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardExpenseSummaryModelToJson(this);

  @override
  DashboardExpenseSummaryEntity toEntity() => DashboardExpenseSummaryEntity(
    totalRecords: totalRecords,
    costsByCurrency: costsByCurrency
        .map((model) => model.toEntity())
        .toList(growable: false),
  );
}

@JsonSerializable(explicitToJson: true)
class DashboardTotalCostSummaryModel
    extends BaseTransformResponseModel<DashboardTotalCostSummaryEntity> {
  const DashboardTotalCostSummaryModel({
    required this.costsByCurrency,
    required this.averageMonthlyCostsByCurrency,
    required this.costsPerKilometerByCurrency,
  });

  final List<CurrencyTotalModel> costsByCurrency;
  final List<CurrencyAverageModel> averageMonthlyCostsByCurrency;
  final List<CurrencyRateModel> costsPerKilometerByCurrency;

  factory DashboardTotalCostSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardTotalCostSummaryModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$DashboardTotalCostSummaryModelToJson(this);

  @override
  DashboardTotalCostSummaryEntity toEntity() =>
      DashboardTotalCostSummaryEntity(
        costsByCurrency: costsByCurrency
            .map((model) => model.toEntity())
            .toList(growable: false),
        averageMonthlyCostsByCurrency: averageMonthlyCostsByCurrency
            .map((model) => model.toEntity())
            .toList(growable: false),
        costsPerKilometerByCurrency: costsPerKilometerByCurrency
            .map((model) => model.toEntity())
            .toList(growable: false),
      );
}

@JsonSerializable(explicitToJson: true)
class DashboardReminderSummaryModel
    extends BaseTransformResponseModel<DashboardReminderSummaryEntity> {
  const DashboardReminderSummaryModel({
    required this.activeCount,
    required this.completedCount,
    required this.nearestUpcoming,
  });

  final int activeCount;
  final int completedCount;
  final ReminderModel? nearestUpcoming;

  factory DashboardReminderSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardReminderSummaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardReminderSummaryModelToJson(this);

  @override
  DashboardReminderSummaryEntity toEntity() => DashboardReminderSummaryEntity(
    activeCount: activeCount,
    completedCount: completedCount,
    nearestUpcoming: nearestUpcoming?.toEntity(),
  );
}
