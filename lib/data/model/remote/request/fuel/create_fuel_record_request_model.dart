import 'package:json_annotation/json_annotation.dart';
part 'create_fuel_record_request_model.g.dart';
@JsonSerializable(includeIfNull: false)
class CreateFuelRecordRequestModel {
  const CreateFuelRecordRequestModel({required this.odometerKm, required this.quantityLiters, required this.pricePerLiter, this.currencyCode, required this.filledAt, required this.fullTank, this.stationName, this.notes});
  final double odometerKm; final double quantityLiters; final double pricePerLiter; final String? currencyCode; final DateTime filledAt; final bool fullTank; final String? stationName; final String? notes;
  factory CreateFuelRecordRequestModel.fromJson(Map<String, dynamic> json) => _$CreateFuelRecordRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateFuelRecordRequestModelToJson(this);
}
