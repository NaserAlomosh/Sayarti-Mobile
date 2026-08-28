extension StringExtension on String? {
  /// Valid value: `test@example.com`
  bool get isValidEmail {
    if (isNullOrEmpty) return false;

    final emailRegex = RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    );

    return emailRegex.hasMatch(trimmed);
  }

  /// Valid value: `+962791234567`
  bool get isValidPhoneNumber {
    if (isNullOrEmpty) return false;

    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');

    return phoneRegex.hasMatch(trimmed);
  }

  /// Valid value: `123456`
  bool get isNumeric {
    if (isNullOrEmpty) return false;

    return RegExp(r'^[0-9]+$').hasMatch(trimmed);
  }

  /// Valid value: `Flutter`
  bool get isAlphabetic {
    if (isNullOrEmpty) return false;

    return RegExp(r'^[A-Za-z]+$').hasMatch(trimmed);
  }

  /// Valid value: `Flutter123`
  bool get isAlphaNumeric {
    if (isNullOrEmpty) return false;

    return RegExp(r'^[A-Za-z0-9]+$').hasMatch(trimmed);
  }

  /// Valid value: `مرحبا`
  bool get containsArabic {
    if (isNullOrEmpty) return false;

    return RegExp(r'[\u0600-\u06FF]').hasMatch(this!);
  }

  /// Valid value: `Hello`
  bool get containsEnglish {
    if (isNullOrEmpty) return false;

    return RegExp(r'[A-Za-z]').hasMatch(this!);
  }

  /// Valid value: `https://example.com`
  bool get isValidUrl {
    if (isNullOrEmpty) return false;

    final uri = Uri.tryParse(trimmed);

    return uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  /// Valid value: `Test@123`
  ///
  /// Requirements:
  /// - Minimum 8 characters
  /// - At least one uppercase letter
  /// - At least one lowercase letter
  /// - At least one number
  /// - At least one special character: `@$!%*?&`
  bool get isValidPassword {
    if (isNullOrEmpty) return false;
    return this!.length >= 8;
  }

  /// Valid value: Any non-null and non-empty string, e.g. `Hello`
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Invalid values: `null`, `''`, `'   '`
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  /// Example: `'  Hello  '` becomes `'Hello'`
  String get trimmed => this?.trim() ?? '';

  /// Valid value for `hasMinLength(5)`: `Hello`
  bool hasMinLength(int length) {
    if (isNullOrEmpty) return false;

    return this!.length >= length;
  }

  /// Valid value for `hasMaxLength(5)`: `Hello`
  bool hasMaxLength(int length) {
    if (this == null) return false;

    return this!.length <= length;
  }

  /// Valid value for `hasExactLength(5)`: `Hello`
  bool hasExactLength(int length) {
    if (this == null) return false;

    return this!.length == length;
  }

  /// Valid values: `Hello` matches `Hello`
  bool matches(String? other) {
    if (this == null || other == null) return false;

    return this == other;
  }
}
