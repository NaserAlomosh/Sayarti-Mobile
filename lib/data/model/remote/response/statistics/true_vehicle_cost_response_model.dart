import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/true_vehicle_cost_model.dart';
part 'true_vehicle_cost_response_model.g.dart';
@JsonSerializable()
class TrueVehicleCostResponseModel extends BaseResponseModel<TrueVehicleCostModel> {
 const TrueVehicleCostResponseModel({required super.success, super.data, super.message, super.error});
 factory TrueVehicleCostResponseModel.fromJson(Map<String,dynamic> json)=>_$TrueVehicleCostResponseModelFromJson(json); Map<String,dynamic> toJson()=>_$TrueVehicleCostResponseModelToJson(this);
}
