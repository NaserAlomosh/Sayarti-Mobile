// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'currency_statistics_model.dart';
CurrencyTotalModel _$CurrencyTotalModelFromJson(Map<String, dynamic> json) => CurrencyTotalModel(currencyCode: json['currencyCode'] as String, amount: (json['amount'] as num).toDouble());
Map<String, dynamic> _$CurrencyTotalModelToJson(CurrencyTotalModel instance) => <String, dynamic>{'currencyCode': instance.currencyCode, 'amount': instance.amount};
CurrencyAverageModel _$CurrencyAverageModelFromJson(Map<String, dynamic> json) => CurrencyAverageModel(currencyCode: json['currencyCode'] as String, amount: (json['amount'] as num).toDouble());
Map<String, dynamic> _$CurrencyAverageModelToJson(CurrencyAverageModel instance) => <String, dynamic>{'currencyCode': instance.currencyCode, 'amount': instance.amount};
CurrencyRateModel _$CurrencyRateModelFromJson(Map<String, dynamic> json) => CurrencyRateModel(currencyCode: json['currencyCode'] as String, amountPerKm: (json['amountPerKm'] as num?)?.toDouble());
Map<String, dynamic> _$CurrencyRateModelToJson(CurrencyRateModel instance) => <String, dynamic>{'currencyCode': instance.currencyCode, 'amountPerKm': instance.amountPerKm};
