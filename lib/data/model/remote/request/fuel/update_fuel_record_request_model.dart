import 'package:json_annotation/json_annotation.dart';
part 'update_fuel_record_request_model.g.dart';
@JsonSerializable(includeIfNull: false)
class UpdateFuelRecordRequestModel {
  const UpdateFuelRecordRequestModel({this.quantityLiters, this.pricePerLiter, this.currencyCode, this.filledAt, this.fullTank, this.stationName, this.notes});
  final double? quantityLiters; final double? pricePerLiter; final String? currencyCode; final DateTime? filledAt; final bool? fullTank; final String? stationName; final String? notes;
  factory UpdateFuelRecordRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateFuelRecordRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateFuelRecordRequestModelToJson(this);
}
