import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/vehicle/delete_vehicle_model.dart';
part 'delete_vehicle_response_model.g.dart';
@JsonSerializable()
class DeleteVehicleResponseModel extends BaseResponseModel<DeleteVehicleModel> {
 const DeleteVehicleResponseModel({required super.success, super.data, super.message, super.error});
 factory DeleteVehicleResponseModel.fromJson(Map<String,dynamic> json) => _$DeleteVehicleResponseModelFromJson(json);
 Map<String,dynamic> toJson() => _$DeleteVehicleResponseModelToJson(this);
}
