import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/delete_maintenance_record_entity.dart';

part 'delete_maintenance_record_model.g.dart';

@JsonSerializable()
class DeleteMaintenanceRecordModel
    extends BaseTransformResponseModel<DeleteMaintenanceRecordEntity> {
  const DeleteMaintenanceRecordModel({required this.deleted});

  final bool deleted;

  factory DeleteMaintenanceRecordModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteMaintenanceRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteMaintenanceRecordModelToJson(this);

  @override
  DeleteMaintenanceRecordEntity toEntity() =>
      DeleteMaintenanceRecordEntity(deleted: deleted);
}
