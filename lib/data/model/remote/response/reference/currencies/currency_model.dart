import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/reference/currency_entity.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel extends BaseTransformResponseModel<CurrencyEntity> {
  const CurrencyModel({
    required this.code,
    required this.name,
    required this.nameEn,
    required this.nameAr,
    required this.symbol,
    required this.decimalDigits,
  });

  final String code;
  final String name;
  final String nameEn;
  final String nameAr;
  final String symbol;
  final int decimalDigits;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);

  @override
  CurrencyEntity toEntity() => CurrencyEntity(
    code: code,
    name: name,
    nameEn: nameEn,
    nameAr: nameAr,
    symbol: symbol,
    decimalDigits: decimalDigits,
  );
}
