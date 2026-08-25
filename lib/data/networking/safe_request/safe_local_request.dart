import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/error/error_handler.dart';

class SafeLocalRequest {
  SafeLocalRequest._();

  static Future<ApiResult<T>> execute<T>({
    required Future<T> Function() request,
  }) async {
    try {
      final result = await request();

      return ApiResult.success(result);
    } catch (error, stackTrace) {
      return ApiResult.failure(
        ErrorHandler.handle(
          error,
          stackTrace,
        ),
      );
    }
  }

  static Future<ApiResult<void>> executeVoid({
    required Future<void> Function() request,
  }) async {
    try {
      await request();

      return const ApiResult.success(null);
    } catch (error, stackTrace) {
      return ApiResult.failure(
        ErrorHandler.handle(
          error,
          stackTrace,
        ),
      );
    }
  }
}