import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/model/remote/maintenance/maintenance_category_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';

part 'create_maintenance_record_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateMaintenanceRecordRequestModel {
  const CreateMaintenanceRecordRequestModel({
    required this.category,
    required this.title,
    required this.serviceDate,
    required this.mileageKm,
    required this.cost,
    this.currencyCode,
    this.serviceProvider,
    this.notes,
  });

  @JsonKey(
    fromJson: maintenanceCategoryFromJson,
    toJson: maintenanceCategoryToJson,
  )
  final MaintenanceCategory category;
  final String title;
  final DateTime serviceDate;
  final double mileageKm;
  final double cost;
  final String? currencyCode;
  final String? serviceProvider;
  final String? notes;

  factory CreateMaintenanceRecordRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$CreateMaintenanceRecordRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateMaintenanceRecordRequestModelToJson(this);
}
