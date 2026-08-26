import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/delete_vehicle_entity.dart';
part 'delete_vehicle_model.g.dart';
@JsonSerializable()
class DeleteVehicleModel extends BaseTransformResponseModel<DeleteVehicleEntity> {
 const DeleteVehicleModel({required this.deleted}); final bool deleted;
 factory DeleteVehicleModel.fromJson(Map<String,dynamic> json) => _$DeleteVehicleModelFromJson(json);
 Map<String,dynamic> toJson() => _$DeleteVehicleModelToJson(this);
 @override DeleteVehicleEntity toEntity() => DeleteVehicleEntity(deleted: deleted);
}
