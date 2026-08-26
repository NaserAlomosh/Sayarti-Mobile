import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/currency_statistics_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/maintenance_statistics_entity.dart';
import 'package:sayarti_mobile/data/model/remote/maintenance/maintenance_category_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';
part 'maintenance_statistics_model.g.dart';
@JsonSerializable(explicitToJson: true)
class MaintenanceStatisticsModel extends BaseTransformResponseModel<MaintenanceStatisticsEntity> {
 const MaintenanceStatisticsModel({required this.vehicleId, required this.totalMaintenanceRecords, required this.totalMaintenanceCostByCurrency, required this.averageMaintenanceCostByCurrency, required this.latestMaintenanceDate, required this.latestMaintenanceMileage, required this.maintenanceByCategory}); final String vehicleId; final int totalMaintenanceRecords; final List<CurrencyTotalModel> totalMaintenanceCostByCurrency; final List<CurrencyAverageModel> averageMaintenanceCostByCurrency; final DateTime? latestMaintenanceDate; final double? latestMaintenanceMileage; final List<MaintenanceCategoryStatisticsModel> maintenanceByCategory;
 factory MaintenanceStatisticsModel.fromJson(Map<String,dynamic> json)=>_$MaintenanceStatisticsModelFromJson(json); Map<String,dynamic> toJson()=>_$MaintenanceStatisticsModelToJson(this);
 @override MaintenanceStatisticsEntity toEntity()=>MaintenanceStatisticsEntity(vehicleId: vehicleId, totalMaintenanceRecords: totalMaintenanceRecords, totalMaintenanceCostByCurrency: totalMaintenanceCostByCurrency.map((e)=>e.toEntity()).toList(growable:false), averageMaintenanceCostByCurrency: averageMaintenanceCostByCurrency.map((e)=>e.toEntity()).toList(growable:false), latestMaintenanceDate: latestMaintenanceDate, latestMaintenanceMileage: latestMaintenanceMileage, maintenanceByCategory: maintenanceByCategory.map((e)=>e.toEntity()).toList(growable:false));
}

@JsonSerializable(explicitToJson: true)
class MaintenanceCategoryStatisticsModel extends BaseTransformResponseModel<MaintenanceCategoryStatisticsEntity> {
 const MaintenanceCategoryStatisticsModel({required this.category, required this.totalMaintenanceRecords, required this.totalMaintenanceCostByCurrency});
 @JsonKey(fromJson: maintenanceCategoryFromJson, toJson: maintenanceCategoryToJson) final MaintenanceCategory category; final int totalMaintenanceRecords; final List<CurrencyTotalModel> totalMaintenanceCostByCurrency;
 factory MaintenanceCategoryStatisticsModel.fromJson(Map<String,dynamic> json)=>_$MaintenanceCategoryStatisticsModelFromJson(json); Map<String,dynamic> toJson()=>_$MaintenanceCategoryStatisticsModelToJson(this);
 @override MaintenanceCategoryStatisticsEntity toEntity()=>MaintenanceCategoryStatisticsEntity(category:category,totalMaintenanceRecords:totalMaintenanceRecords,totalMaintenanceCostByCurrency:totalMaintenanceCostByCurrency.map((e)=>e.toEntity()).toList(growable:false));
}
