import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:local_auth/local_auth.dart';

import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/networking/error/api_messages.dart';
import 'package:sayarti_mobile/data/networking/error/app_error.dart';
import 'package:sayarti_mobile/data/networking/exceptions/biometric_exception.dart';
import 'package:sayarti_mobile/presentation/core/widgets/language/cubit/languge_cubit.dart';

class ErrorHandler {
  ErrorHandler._();

  static ApiErrorModel handle(Object error, [StackTrace? stackTrace]) {
    if (error is ApiErrorModel) {
      return error;
    }

    if (error is DioException) {
      return _handleDioException(error);
    }

    if (error is SocketException) {
      return ApiErrorModel(
        message: ApiMessages.noInternet,
        originalError: error,
      );
    }

    if (error is TimeoutException) {
      return ApiErrorModel(
        message: ApiMessages.timeout,
        originalError: error,
      );
    }

    if (error is FormatException) {
      return ApiErrorModel(
        message: ApiMessages.invalidResponse,
        originalError: error,
      );
    }

    if (error is LocalAuthException) {
      return BiometricException.fromLocalAuthException(
        error,
        isArabic: appLanguage == AppLanguage.arabic,
      );
    }

    return ApiErrorModel(
      message: ApiMessages.unknownError,
      originalError: error,
    );
  }

  // ---------------------------------------------------------------------------
  // Message Resolution
  // ---------------------------------------------------------------------------

  static String resolveMessage(
    String? apiMessage, {
    required String fallback,
  }) {
    final message = apiMessage?.trim();

    if (message == null || message.isEmpty) {
      return fallback;
    }

    return message;
  }

  static String successMessage<T>(
    BaseResponseModel<T> response, {
    String? fallback,
  }) {
    return resolveMessage(
      response.message,
      fallback: fallback ?? ApiMessages.success,
    );
  }

  static String errorMessage<T>(
    BaseResponseModel<T> response, {
    int? statusCode,
  }) {
    return resolveMessage(
      response.error?.message,
      fallback: _messageFromStatusCode(statusCode),
    );
  }

  // ---------------------------------------------------------------------------
  // Response Errors
  // ---------------------------------------------------------------------------

  static ApiErrorModel fromResponse<T>(
    BaseResponseModel<T> response, {
    int? statusCode,
    Object? originalError,
  }) {
    return ApiErrorModel(
      message: errorMessage(
        response,
        statusCode: statusCode,
      ),
      code: response.error?.code,
      details: response.error?.details ?? const {},
      statusCode: statusCode,
      originalError: originalError,
    );
  }

  static ApiErrorModel fromApiError(
    ApiErrorModel? error, {
    int? statusCode,
    Object? originalError,
    String? fallbackMessage,
  }) {
    return ApiErrorModel(
      message: resolveMessage(
        error?.message,
        fallback:
            fallbackMessage ?? _messageFromStatusCode(statusCode),
      ),
      code: error?.code,
      details: error?.details ?? const {},
      statusCode: statusCode,
      originalError: originalError,
    );
  }

  static ApiErrorModel fromHttpStatusCode(
    int? statusCode, {
    Object? originalError,
    String? message,
  }) {
    return ApiErrorModel(
      message: resolveMessage(
        message,
        fallback: _messageFromStatusCode(statusCode),
      ),
      statusCode: statusCode,
      originalError: originalError,
    );
  }

  static void throwIfFailed<T>(
    BaseResponseModel<T> response, {
    int? statusCode,
    String? fallbackMessage,
  }) {
    if (response.success) {
      return;
    }

    throw ApiErrorModel(
      message: resolveMessage(
        response.error?.message,
        fallback:
            fallbackMessage ?? _messageFromStatusCode(statusCode),
      ),
      code: response.error?.code,
      details: response.error?.details ?? const {},
      statusCode: statusCode,
    );
  }

  // ---------------------------------------------------------------------------
  // Dio
  // ---------------------------------------------------------------------------

  static ApiErrorModel _handleDioException(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    final apiError = _extractApiError(response?.data);

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return ApiErrorModel(
          message: ApiMessages.timeout,
          statusCode: statusCode,
          originalError: error,
        );

      case DioExceptionType.connectionError:
        return ApiErrorModel(
          message: ApiMessages.noInternet,
          statusCode: statusCode,
          originalError: error,
        );

      case DioExceptionType.cancel:
        return ApiErrorModel(
          message: ApiMessages.requestCancelled,
          statusCode: statusCode,
          originalError: error,
        );

      case DioExceptionType.badCertificate:
        return ApiErrorModel(
          message: ApiMessages.unknownError,
          statusCode: statusCode,
          originalError: error,
        );

      case DioExceptionType.badResponse:
        return fromApiError(
          apiError,
          statusCode: statusCode,
          originalError: error,
        );

      case DioExceptionType.unknown:
        return _handleUnknownDioException(
          error,
          apiError: apiError,
          statusCode: statusCode,
        );
    }
  }

  static ApiErrorModel _handleUnknownDioException(
    DioException error, {
    required ApiErrorModel? apiError,
    required int? statusCode,
  }) {
    final originalError = error.error;

    if (originalError is SocketException) {
      return ApiErrorModel(
        message: ApiMessages.noInternet,
        statusCode: statusCode,
        originalError: error,
      );
    }

    if (originalError is TimeoutException) {
      return ApiErrorModel(
        message: ApiMessages.timeout,
        statusCode: statusCode,
        originalError: error,
      );
    }

    if (originalError is FormatException) {
      return ApiErrorModel(
        message: ApiMessages.invalidResponse,
        statusCode: statusCode,
        originalError: error,
      );
    }

    return fromApiError(
      apiError,
      statusCode: statusCode,
      originalError: error,
    );
  }

  // ---------------------------------------------------------------------------
  // Error Response Parsing
  // ---------------------------------------------------------------------------

  static ApiErrorModel? _extractApiError(dynamic data) {
    if (data is! Map) {
      return null;
    }

    try {
      final json = Map<String, dynamic>.from(data);
      final errorJson = json['error'];

      if (errorJson is! Map) {
        return null;
      }

      return ApiErrorModel.fromJson(
        Map<String, dynamic>.from(errorJson),
      );
    } catch (_) {
      return null;
    }
  }

  // ---------------------------------------------------------------------------
  // HTTP Messages
  // ---------------------------------------------------------------------------

  static String _messageFromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 401:
        return ApiMessages.unauthorized;

      case 408:
        return ApiMessages.timeout;

      case 400:
      case 403:
      case 404:
      case 409:
      case 422:
      case 429:
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
      default:
        return ApiMessages.unknownError;
    }
  }
}