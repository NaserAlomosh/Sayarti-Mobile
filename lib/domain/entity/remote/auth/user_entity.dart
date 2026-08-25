class UserEntity {
  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.authProvider,
    required this.countryCode,
    required this.defaultCurrencyCode,
    required this.preferredLanguage,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool emailVerified;
  final String authProvider;
  final String? countryCode;
  final String? defaultCurrencyCode;
  final String preferredLanguage;
  final DateTime createdAt;
  final DateTime updatedAt;
}
