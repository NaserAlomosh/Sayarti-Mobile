class BaseResponseModel<T> {
  const BaseResponseModel({
    required this.success,
    this.data,
    this.message,
    this.error,
  });

  final bool success;
  final T? data;
  final String? message;
  final ApiErrorModel? error;

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return BaseResponseModel<T>(
      success: json['success'] as bool? ?? false,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'] as String?,
      error: json['error'] is Map
          ? ApiErrorModel.fromJson(
              Map<String, dynamic>.from(json['error'] as Map),
            )
          : null,
    );
  }
}



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

  /// Internal runtime error.
  /// Should not be serialized.
  final Object? originalError;

  bool get hasDetails => details.isNotEmpty;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      code: json['code'] as String?,
      message: json['message'] as String?,
      details: _parseDetails(json['details']),
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      'details': details,
      if (statusCode != null) 'statusCode': statusCode,
    };
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