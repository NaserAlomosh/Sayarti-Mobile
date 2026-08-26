import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/currency_statistics_entity.dart';
part 'currency_statistics_model.g.dart';
@JsonSerializable()
class CurrencyTotalModel extends BaseTransformResponseModel<CurrencyTotalEntity> {
 const CurrencyTotalModel({required this.currencyCode, required this.amount}); final String currencyCode; final double amount;
 factory CurrencyTotalModel.fromJson(Map<String,dynamic> json) => _$CurrencyTotalModelFromJson(json); Map<String,dynamic> toJson()=>_$CurrencyTotalModelToJson(this);
 @override CurrencyTotalEntity toEntity()=>CurrencyTotalEntity(currencyCode: currencyCode, amount: amount);
}
@JsonSerializable()
class CurrencyAverageModel extends BaseTransformResponseModel<CurrencyAverageEntity> {
 const CurrencyAverageModel({required this.currencyCode, required this.amount}); final String currencyCode; final double amount;
 factory CurrencyAverageModel.fromJson(Map<String,dynamic> json) => _$CurrencyAverageModelFromJson(json); Map<String,dynamic> toJson()=>_$CurrencyAverageModelToJson(this);
 @override CurrencyAverageEntity toEntity()=>CurrencyAverageEntity(currencyCode: currencyCode, amount: amount);
}
@JsonSerializable()
class CurrencyRateModel extends BaseTransformResponseModel<CurrencyRateEntity> {
 const CurrencyRateModel({required this.currencyCode, required this.amountPerKm}); final String currencyCode; final double? amountPerKm;
 factory CurrencyRateModel.fromJson(Map<String,dynamic> json) => _$CurrencyRateModelFromJson(json); Map<String,dynamic> toJson()=>_$CurrencyRateModelToJson(this);
 @override CurrencyRateEntity toEntity()=>CurrencyRateEntity(currencyCode: currencyCode, amountPerKm: amountPerKm);
}
