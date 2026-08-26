import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/vehicle/vehicle_model.dart';
part 'vehicle_response_model.g.dart';
@JsonSerializable()
class VehicleResponseModel extends BaseResponseModel<VehicleModel> {
 const VehicleResponseModel({required super.success, super.data, super.message, super.error});
 factory VehicleResponseModel.fromJson(Map<String,dynamic> json) => _$VehicleResponseModelFromJson(json);
 Map<String,dynamic> toJson() => _$VehicleResponseModelToJson(this);
}
