import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/model/remote/vehicle/vehicle_enum_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';
part 'create_vehicle_request_model.g.dart';
@JsonSerializable()
class CreateVehicleRequestModel {
 const CreateVehicleRequestModel({required this.brand, required this.model, required this.year, required this.powertrainType, required this.currentMileage, this.licensePlate, this.nickname, this.imageUrl, this.fuelType, this.fuelTankCapacityLiters, this.batteryCapacityKwh, this.estimatedRangeKm});
 final String brand; final String model; final int year;
 @JsonKey(toJson: powertrainTypeToJson) final PowertrainType powertrainType;
 final int currentMileage; final String? licensePlate; final String? nickname; final String? imageUrl;
 @JsonKey(toJson: fuelTypeToJson) final FuelType? fuelType;
 final double? fuelTankCapacityLiters; final double? batteryCapacityKwh; final double? estimatedRangeKm;
 factory CreateVehicleRequestModel.fromJson(Map<String,dynamic> json) => _$CreateVehicleRequestModelFromJson(json);
 Map<String,dynamic> toJson() => _$CreateVehicleRequestModelToJson(this);
}
