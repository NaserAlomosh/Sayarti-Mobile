import 'package:sayarti_mobile/data/networking/dio/network_properties.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@lazySingleton
class DioClient {
  DioClient({
    required this._dio,
 
  }) {
    _configure(
   
    );
  }

  final Dio _dio;

  Dio get dio => _dio;

  void _configure() {
    _dio.options = BaseOptions(
      baseUrl: NetworkProperties.baseChannelUrl,
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      transformTimeout: const Duration(seconds: 60),       
    );

    _dio.interceptors.clear();

    _dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          logPrint: (log) => debugPrint(log.toString()),
        ),
    ]);
  }
}
