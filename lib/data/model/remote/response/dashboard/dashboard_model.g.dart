// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      vehicleId: json['vehicleId'] as String,
      vehicle: VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      currentMileage: (json['currentMileage'] as num).toInt(),
      fuel: DashboardFuelSummaryModel.fromJson(
        json['fuel'] as Map<String, dynamic>,
      ),
      maintenance: DashboardMaintenanceSummaryModel.fromJson(
        json['maintenance'] as Map<String, dynamic>,
      ),
      expenses: DashboardExpenseSummaryModel.fromJson(
        json['expenses'] as Map<String, dynamic>,
      ),
      totalVehicleCost: DashboardTotalCostSummaryModel.fromJson(
        json['totalVehicleCost'] as Map<String, dynamic>,
      ),
      reminders: DashboardReminderSummaryModel.fromJson(
        json['reminders'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'vehicle': instance.vehicle.toJson(),
      'currentMileage': instance.currentMileage,
      'fuel': instance.fuel.toJson(),
      'maintenance': instance.maintenance.toJson(),
      'expenses': instance.expenses.toJson(),
      'totalVehicleCost': instance.totalVehicleCost.toJson(),
      'reminders': instance.reminders.toJson(),
    };

DashboardFuelSummaryModel _$DashboardFuelSummaryModelFromJson(
  Map<String, dynamic> json,
) => DashboardFuelSummaryModel(
  totalRecords: (json['totalRecords'] as num).toInt(),
  totalQuantityLiters: (json['totalQuantityLiters'] as num).toDouble(),
  costsByCurrency: (json['costsByCurrency'] as List<dynamic>)
      .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  averageKmPerLiter: (json['averageKmPerLiter'] as num?)?.toDouble(),
  averageLitersPer100Km: (json['averageLitersPer100Km'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DashboardFuelSummaryModelToJson(
  DashboardFuelSummaryModel instance,
) => <String, dynamic>{
  'totalRecords': instance.totalRecords,
  'totalQuantityLiters': instance.totalQuantityLiters,
  'costsByCurrency': instance.costsByCurrency.map((e) => e.toJson()).toList(),
  'averageKmPerLiter': instance.averageKmPerLiter,
  'averageLitersPer100Km': instance.averageLitersPer100Km,
};

DashboardMaintenanceSummaryModel _$DashboardMaintenanceSummaryModelFromJson(
  Map<String, dynamic> json,
) => DashboardMaintenanceSummaryModel(
  totalRecords: (json['totalRecords'] as num).toInt(),
  latestMaintenanceDate: json['latestMaintenanceDate'] == null
      ? null
      : DateTime.parse(json['latestMaintenanceDate'] as String),
  costsByCurrency: (json['costsByCurrency'] as List<dynamic>)
      .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DashboardMaintenanceSummaryModelToJson(
  DashboardMaintenanceSummaryModel instance,
) => <String, dynamic>{
  'totalRecords': instance.totalRecords,
  'latestMaintenanceDate': instance.latestMaintenanceDate?.toIso8601String(),
  'costsByCurrency': instance.costsByCurrency.map((e) => e.toJson()).toList(),
};

DashboardExpenseSummaryModel _$DashboardExpenseSummaryModelFromJson(
  Map<String, dynamic> json,
) => DashboardExpenseSummaryModel(
  totalRecords: (json['totalRecords'] as num).toInt(),
  costsByCurrency: (json['costsByCurrency'] as List<dynamic>)
      .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DashboardExpenseSummaryModelToJson(
  DashboardExpenseSummaryModel instance,
) => <String, dynamic>{
  'totalRecords': instance.totalRecords,
  'costsByCurrency': instance.costsByCurrency.map((e) => e.toJson()).toList(),
};

DashboardTotalCostSummaryModel _$DashboardTotalCostSummaryModelFromJson(
  Map<String, dynamic> json,
) => DashboardTotalCostSummaryModel(
  costsByCurrency: (json['costsByCurrency'] as List<dynamic>)
      .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  averageMonthlyCostsByCurrency:
      (json['averageMonthlyCostsByCurrency'] as List<dynamic>)
          .map((e) => CurrencyAverageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  costsPerKilometerByCurrency:
      (json['costsPerKilometerByCurrency'] as List<dynamic>)
          .map((e) => CurrencyRateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DashboardTotalCostSummaryModelToJson(
  DashboardTotalCostSummaryModel instance,
) => <String, dynamic>{
  'costsByCurrency': instance.costsByCurrency.map((e) => e.toJson()).toList(),
  'averageMonthlyCostsByCurrency': instance.averageMonthlyCostsByCurrency
      .map((e) => e.toJson())
      .toList(),
  'costsPerKilometerByCurrency': instance.costsPerKilometerByCurrency
      .map((e) => e.toJson())
      .toList(),
};

DashboardReminderSummaryModel _$DashboardReminderSummaryModelFromJson(
  Map<String, dynamic> json,
) => DashboardReminderSummaryModel(
  activeCount: (json['activeCount'] as num).toInt(),
  completedCount: (json['completedCount'] as num).toInt(),
  nearestUpcoming: json['nearestUpcoming'] == null
      ? null
      : ReminderModel.fromJson(json['nearestUpcoming'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DashboardReminderSummaryModelToJson(
  DashboardReminderSummaryModel instance,
) => <String, dynamic>{
  'activeCount': instance.activeCount,
  'completedCount': instance.completedCount,
  'nearestUpcoming': instance.nearestUpcoming?.toJson(),
};
