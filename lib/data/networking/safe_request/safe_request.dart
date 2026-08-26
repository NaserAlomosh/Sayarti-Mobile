import 'package:retrofit/dio.dart';

import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/error/error_handler.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';

class SafeRequest {
  SafeRequest._();

  static Future<ApiResult<BaseResponseEntity<E>>> execute<E>({
    required Future<HttpResponse<dynamic>> request,
  }) async {
    try {
      final httpResponse = await request;

      final statusCode = httpResponse.response.statusCode;
      final response = _extractBaseResponse(httpResponse.data);

      final failure = _validateResponse(
        response: response,
        statusCode: statusCode,
        originalResponse: httpResponse.response,
      );

      if (failure != null) {
        return ApiResult.failure(failure);
      }

      final data = response.data;

      if (data == null) {
        throw StateError(
          'Expected response data, but received null.',
        );
      }

      if (data is! BaseTransformResponseModel) {
        throw StateError(
          '${data.runtimeType} must extend '
          'BaseTransformResponseModel<$E>.',
        );
      }

      final entity = data.toEntity();

      if (entity is! E) {
        throw StateError(
          '${data.runtimeType}.toEntity() returned '
          '${entity.runtimeType}, but $E was expected.',
        );
      }

      return ApiResult.success(
        BaseResponseEntity<E>(
          success: response.success,
          data: entity,
          message: response.message,
        ),
      );
    } catch (error, stackTrace) {
      return ApiResult.failure(
        ErrorHandler.handle(
          error,
          stackTrace,
        ),
      );
    }
  }

  static Future<ApiResult<BaseResponseEntity<List<E>>>> executeList<E>({
    required Future<HttpResponse<dynamic>> request,
  }) async {
    try {
      final httpResponse = await request;

      final statusCode = httpResponse.response.statusCode;
      final response = _extractBaseResponse(httpResponse.data);

      final failure = _validateResponse(
        response: response,
        statusCode: statusCode,
        originalResponse: httpResponse.response,
      );

      if (failure != null) {
        return ApiResult.failure(failure);
      }

      final data = response.data;

      if (data is! List) {
        throw StateError(
          'Expected List data, but received ${data.runtimeType}.',
        );
      }

      final entities = data.map<E>((item) {
        if (item is! BaseTransformResponseModel) {
          throw StateError(
            '${item.runtimeType} must extend '
            'BaseTransformResponseModel<$E>.',
          );
        }

        final entity = item.toEntity();

        if (entity is! E) {
          throw StateError(
            '${item.runtimeType}.toEntity() returned '
            '${entity.runtimeType}, but $E was expected.',
          );
        }

        return entity;
      }).toList(growable: false);

      return ApiResult.success(
        BaseResponseEntity<List<E>>(
          success: response.success,
          data: entities,
          message: response.message,
        ),
      );
    } catch (error, stackTrace) {
      return ApiResult.failure(
        ErrorHandler.handle(
          error,
          stackTrace,
        ),
      );
    }
  }

  static BaseResponseModel<dynamic> _extractBaseResponse(dynamic data) {
    if (data is BaseResponseModel<dynamic>) {
      return data;
    }

    throw StateError(
      '${data.runtimeType} must be BaseResponseModel.',
    );
  }

  static ApiErrorModel? _validateResponse({
    required BaseResponseModel<dynamic> response,
    required int? statusCode,
    required Object originalResponse,
  }) {
    if (!_isSuccessfulStatusCode(statusCode)) {
      return ErrorHandler.fromResponse(
        response,
        statusCode: statusCode,
        originalError: originalResponse,
      );
    }

    if (!response.success) {
      return ErrorHandler.fromResponse(
        response,
        statusCode: statusCode,
        originalError: originalResponse,
      );
    }

    return null;
  }

  static bool _isSuccessfulStatusCode(int? statusCode) {
    return statusCode != null &&
        statusCode >= 200 &&
        statusCode < 300;
  }
}