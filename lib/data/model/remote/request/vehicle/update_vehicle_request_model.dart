import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/model/remote/vehicle/vehicle_enum_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';

part 'update_vehicle_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateVehicleRequestModel {

  const UpdateVehicleRequestModel({
    this.brand,
    this.model,
    this.year,
    this.powertrainType,
    this.licensePlate,
    this.nickname,
    this.imageUrl,
    this.fuelType,
    this.fuelTankCapacityLiters,
    this.batteryCapacityKwh,
    this.estimatedRangeKm,
  });

  final String? brand;
  final String? model;
  final int? year;
  @JsonKey(toJson: powertrainTypeToJson)
  final PowertrainType? powertrainType;
  final String? licensePlate;
  final String? nickname;
  final String? imageUrl;
  @JsonKey(toJson: fuelTypeToJson)
  final FuelType? fuelType;
  final double? fuelTankCapacityLiters;
  final double? batteryCapacityKwh;
  final double? estimatedRangeKm;

  factory UpdateVehicleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateVehicleRequestModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$UpdateVehicleRequestModelToJson(this);
}
