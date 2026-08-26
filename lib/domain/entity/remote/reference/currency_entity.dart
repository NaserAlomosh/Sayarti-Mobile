class CurrencyEntity {
  const CurrencyEntity({
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
}
