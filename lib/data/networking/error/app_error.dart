class ApiErrorModel implements Exception {
  const ApiErrorModel({
    this.code,
    this.message,
    this.details = const {},
    this.statusCode,
    this.originalError,
  });

  final String? code;
  final String? message;
  final Map<String, String> details;
  final int? statusCode;
  final Object? originalError;

  bool get hasDetails => details.isNotEmpty;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      code: json['code'] as String?,
      message: json['message'] as String?,
      details: _parseDetails(json['details']),
    );
  }

  static Map<String, String> _parseDetails(Object? value) {
    if (value is! Map) {
      return const {};
    }

    return value.map<String, String>(
      (key, value) => MapEntry(
        key.toString(),
        value?.toString() ?? '',
      ),
    );
  }

  @override
  String toString() => message ?? 'Unknown error';
}

