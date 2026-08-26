import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sayarti_mobile/data/networking/dio/auth_interceptor.dart';
import 'package:sayarti_mobile/data/networking/dio/network_properties.dart';
import 'package:sayarti_mobile/domain/storage/auth/auth_session_storage.dart';

class DioClient {
  DioClient({
    required this._dio,
    required AuthSessionStorage sessionStorage,
  }) {
    _configure(sessionStorage);
  }

  final Dio _dio;

  Dio get dio => _dio;

  void _configure(AuthSessionStorage sessionStorage) {
    _dio.options = BaseOptions(
      baseUrl: NetworkProperties.baseChannelUrl,
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      transformTimeout: const Duration(seconds: 60),
    );

    _dio.interceptors.clear();

    final refreshDio = Dio()..options = _dio.options.copyWith();

    _dio.interceptors.addAll([
      AuthInterceptor(
        sessionStorage: sessionStorage,
        applicationDio: _dio,
        refreshDio: refreshDio,
      ),
      if (kDebugMode)
        PrettyDioLogger(
          requestBody: false,
          requestHeader: false,
          responseBody: false,
          responseHeader: true,
          logPrint: (log) => debugPrint(log.toString()),
        ),
    ]);
  }
}
