import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/model/remote/maintenance/maintenance_category_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';

part 'update_maintenance_record_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateMaintenanceRecordRequestModel {
  const UpdateMaintenanceRecordRequestModel({
    this.category,
    this.title,
    this.serviceDate,
    this.mileageKm,
    this.cost,
    this.currencyCode,
    this.serviceProvider,
    this.notes,
  });

  @JsonKey(
    fromJson: maintenanceCategoryNullableFromJson,
    toJson: maintenanceCategoryNullableToJson,
  )
  final MaintenanceCategory? category;
  final String? title;
  final DateTime? serviceDate;
  final double? mileageKm;
  final double? cost;
  final String? currencyCode;
  final String? serviceProvider;
  final String? notes;

  factory UpdateMaintenanceRecordRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$UpdateMaintenanceRecordRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateMaintenanceRecordRequestModelToJson(this);
}
