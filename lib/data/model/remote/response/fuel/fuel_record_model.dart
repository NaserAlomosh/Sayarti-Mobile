import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_record_entity.dart';
part 'fuel_record_model.g.dart';
@JsonSerializable()
class FuelRecordModel extends BaseTransformResponseModel<FuelRecordEntity> {
  const FuelRecordModel({required this.id, required this.vehicleId, required this.odometerKm, required this.quantityLiters, required this.pricePerLiter, required this.totalCost, required this.currencyCode, required this.filledAt, required this.fullTank, required this.stationName, required this.notes, required this.createdAt, required this.updatedAt});
  final String id; final String vehicleId; final double odometerKm; final double quantityLiters; final double pricePerLiter; final double totalCost; final String currencyCode; final DateTime filledAt; final bool fullTank; final String? stationName; final String? notes; final DateTime createdAt; final DateTime updatedAt;
  factory FuelRecordModel.fromJson(Map<String, dynamic> json) => _$FuelRecordModelFromJson(json);
  Map<String, dynamic> toJson() => _$FuelRecordModelToJson(this);
  @override FuelRecordEntity toEntity() => FuelRecordEntity(id: id, vehicleId: vehicleId, odometerKm: odometerKm, quantityLiters: quantityLiters, pricePerLiter: pricePerLiter, totalCost: totalCost, currencyCode: currencyCode, filledAt: filledAt, fullTank: fullTank, stationName: stationName, notes: notes, createdAt: createdAt, updatedAt: updatedAt);
}
