import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reference/countries/country_model.dart';

part 'countries_response_model.g.dart';

@JsonSerializable()
class CountriesResponseModel extends BaseResponseModel<List<CountryModel>> {
  const CountriesResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory CountriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesResponseModelToJson(this);
}
