class CountryEntity {
  const CountryEntity({
    required this.code,
    required this.nameEn,
    required this.nameAr,
    required this.defaultCurrencyCode,
  });

  final String code;
  final String nameEn;
  final String nameAr;
  final String defaultCurrencyCode;
}
