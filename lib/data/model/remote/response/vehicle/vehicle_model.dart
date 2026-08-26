import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/vehicle/vehicle_enum_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';
part 'vehicle_model.g.dart';
@JsonSerializable()
class VehicleModel extends BaseTransformResponseModel<VehicleEntity> {
 const VehicleModel({required this.id, required this.brand, required this.model, required this.year, required this.powertrainType, required this.currentMileage, required this.licensePlate, required this.nickname, required this.imageUrl, required this.fuelType, required this.fuelTankCapacityLiters, required this.batteryCapacityKwh, required this.estimatedRangeKm, required this.createdAt, required this.updatedAt});
 final String id; final String brand; final String model; final int year;
 @JsonKey(fromJson: powertrainTypeFromJson, toJson: powertrainTypeToJson) final PowertrainType powertrainType;
 final int currentMileage; final String? licensePlate; final String? nickname; final String? imageUrl;
 @JsonKey(fromJson: fuelTypeFromJson, toJson: fuelTypeToJson) final FuelType? fuelType;
 final double? fuelTankCapacityLiters; final double? batteryCapacityKwh; final double? estimatedRangeKm;
 final DateTime createdAt; final DateTime updatedAt;
 factory VehicleModel.fromJson(Map<String,dynamic> json) => _$VehicleModelFromJson(json);
 Map<String,dynamic> toJson() => _$VehicleModelToJson(this);
 @override VehicleEntity toEntity() => VehicleEntity(id: id, brand: brand, model: model, year: year, powertrainType: powertrainType, currentMileage: currentMileage, licensePlate: licensePlate, nickname: nickname, imageUrl: imageUrl, fuelType: fuelType, fuelTankCapacityLiters: fuelTankCapacityLiters, batteryCapacityKwh: batteryCapacityKwh, estimatedRangeKm: estimatedRangeKm, createdAt: createdAt, updatedAt: updatedAt);
}
