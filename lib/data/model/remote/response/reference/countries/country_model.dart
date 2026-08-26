import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/reference/country_entity.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends BaseTransformResponseModel<CountryEntity> {
  const CountryModel({
    required this.code,
    required this.nameEn,
    required this.nameAr,
    required this.defaultCurrencyCode,
  });

  final String code;
  final String nameEn;
  final String nameAr;
  final String defaultCurrencyCode;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  @override
  CountryEntity toEntity() => CountryEntity(
    code: code,
    nameEn: nameEn,
    nameAr: nameAr,
    defaultCurrencyCode: defaultCurrencyCode,
  );
}
