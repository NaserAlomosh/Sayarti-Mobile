import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/delete_fuel_record_entity.dart';
part 'delete_fuel_record_model.g.dart';
@JsonSerializable()
class DeleteFuelRecordModel extends BaseTransformResponseModel<DeleteFuelRecordEntity> {
  const DeleteFuelRecordModel({required this.deleted}); final bool deleted;
  factory DeleteFuelRecordModel.fromJson(Map<String, dynamic> json) => _$DeleteFuelRecordModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteFuelRecordModelToJson(this);
  @override DeleteFuelRecordEntity toEntity() => DeleteFuelRecordEntity(deleted: deleted);
}
