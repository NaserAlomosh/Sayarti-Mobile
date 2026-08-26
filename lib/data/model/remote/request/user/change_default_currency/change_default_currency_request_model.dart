import 'package:json_annotation/json_annotation.dart';

part 'change_default_currency_request_model.g.dart';

@JsonSerializable()
class ChangeDefaultCurrencyRequestModel {
  const ChangeDefaultCurrencyRequestModel({required this.currencyCode});

  final String currencyCode;

  factory ChangeDefaultCurrencyRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ChangeDefaultCurrencyRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ChangeDefaultCurrencyRequestModelToJson(this);
}
