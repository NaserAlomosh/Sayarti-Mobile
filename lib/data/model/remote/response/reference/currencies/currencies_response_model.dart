import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reference/currencies/currency_model.dart';

part 'currencies_response_model.g.dart';

@JsonSerializable()
class CurrenciesResponseModel extends BaseResponseModel<List<CurrencyModel>> {
  const CurrenciesResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory CurrenciesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CurrenciesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrenciesResponseModelToJson(this);
}
