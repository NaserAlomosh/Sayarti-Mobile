import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/vehicle_activity/vehicle_activity_model.dart';

part 'get_vehicle_activity_response_model.g.dart';

@JsonSerializable()
class GetVehicleActivityResponseModel
    extends BaseResponseModel<List<VehicleActivityModel>> {
  const GetVehicleActivityResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory GetVehicleActivityResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$GetVehicleActivityResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetVehicleActivityResponseModelToJson(this);
}
