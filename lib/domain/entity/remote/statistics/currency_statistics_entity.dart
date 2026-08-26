class CurrencyTotalEntity {
  const CurrencyTotalEntity({required this.currencyCode, required this.amount});
  final String currencyCode;
  final double amount;
}

class CurrencyAverageEntity {
  const CurrencyAverageEntity({required this.currencyCode, required this.amount});
  final String currencyCode;
  final double amount;
}

class CurrencyRateEntity {
  const CurrencyRateEntity({required this.currencyCode, required this.amountPerKm});
  final String currencyCode;
  final double? amountPerKm;
}
