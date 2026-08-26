// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceStatisticsModel _$MaintenanceStatisticsModelFromJson(
  Map<String, dynamic> json,
) => MaintenanceStatisticsModel(
  vehicleId: json['vehicleId'] as String,
  totalMaintenanceRecords: (json['totalMaintenanceRecords'] as num).toInt(),
  totalMaintenanceCostByCurrency:
      (json['totalMaintenanceCostByCurrency'] as List<dynamic>)
          .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  averageMaintenanceCostByCurrency:
      (json['averageMaintenanceCostByCurrency'] as List<dynamic>)
          .map((e) => CurrencyAverageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  latestMaintenanceDate: json['latestMaintenanceDate'] == null
      ? null
      : DateTime.parse(json['latestMaintenanceDate'] as String),
  latestMaintenanceMileage: (json['latestMaintenanceMileage'] as num?)
      ?.toDouble(),
  maintenanceByCategory: (json['maintenanceByCategory'] as List<dynamic>)
      .map(
        (e) => MaintenanceCategoryStatisticsModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$MaintenanceStatisticsModelToJson(
  MaintenanceStatisticsModel instance,
) => <String, dynamic>{
  'vehicleId': instance.vehicleId,
  'totalMaintenanceRecords': instance.totalMaintenanceRecords,
  'totalMaintenanceCostByCurrency': instance.totalMaintenanceCostByCurrency
      .map((e) => e.toJson())
      .toList(),
  'averageMaintenanceCostByCurrency': instance.averageMaintenanceCostByCurrency
      .map((e) => e.toJson())
      .toList(),
  'latestMaintenanceDate': instance.latestMaintenanceDate?.toIso8601String(),
  'latestMaintenanceMileage': instance.latestMaintenanceMileage,
  'maintenanceByCategory': instance.maintenanceByCategory
      .map((e) => e.toJson())
      .toList(),
};

MaintenanceCategoryStatisticsModel _$MaintenanceCategoryStatisticsModelFromJson(
  Map<String, dynamic> json,
) => MaintenanceCategoryStatisticsModel(
  category: maintenanceCategoryFromJson(json['category'] as String),
  totalMaintenanceRecords: (json['totalMaintenanceRecords'] as num).toInt(),
  totalMaintenanceCostByCurrency:
      (json['totalMaintenanceCostByCurrency'] as List<dynamic>)
          .map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MaintenanceCategoryStatisticsModelToJson(
  MaintenanceCategoryStatisticsModel instance,
) => <String, dynamic>{
  'category': maintenanceCategoryToJson(instance.category),
  'totalMaintenanceRecords': instance.totalMaintenanceRecords,
  'totalMaintenanceCostByCurrency': instance.totalMaintenanceCostByCurrency
      .map((e) => e.toJson())
      .toList(),
};
