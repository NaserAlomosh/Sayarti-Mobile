import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/maintenance/maintenance_category_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';

part 'maintenance_record_model.g.dart';

@JsonSerializable()
class MaintenanceRecordModel
    extends BaseTransformResponseModel<MaintenanceRecordEntity> {
  const MaintenanceRecordModel({
    required this.id,
    required this.vehicleId,
    required this.category,
    required this.title,
    required this.serviceDate,
    required this.mileageKm,
    required this.cost,
    required this.currencyCode,
    required this.serviceProvider,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String vehicleId;
  @JsonKey(fromJson: maintenanceCategoryFromJson, toJson: maintenanceCategoryToJson)
  final MaintenanceCategory category;
  final String title;
  final DateTime serviceDate;
  final double mileageKm;
  final double cost;
  final String currencyCode;
  final String? serviceProvider;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory MaintenanceRecordModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceRecordModelToJson(this);

  @override
  MaintenanceRecordEntity toEntity() => MaintenanceRecordEntity(
    id: id,
    vehicleId: vehicleId,
    category: category,
    title: title,
    serviceDate: serviceDate,
    mileageKm: mileageKm,
    cost: cost,
    currencyCode: currencyCode,
    serviceProvider: serviceProvider,
    notes: notes,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
