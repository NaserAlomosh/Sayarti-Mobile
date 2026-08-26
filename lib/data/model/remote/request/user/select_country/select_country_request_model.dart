import 'package:json_annotation/json_annotation.dart';

part 'select_country_request_model.g.dart';

@JsonSerializable()
class SelectCountryRequestModel {
  const SelectCountryRequestModel({required this.countryCode});

  final String countryCode;

  factory SelectCountryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SelectCountryRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectCountryRequestModelToJson(this);
}
