class RegistrationContentEntity {
  const RegistrationContentEntity({
    required this.email,
    required this.verificationRequired,
  });

  final String email;
  final bool verificationRequired;
}
