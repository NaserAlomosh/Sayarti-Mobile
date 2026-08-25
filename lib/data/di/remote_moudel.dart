import 'package:sayarti_mobile/data/networking/dio/dio_client.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RemoteMoudel {
  @lazySingleton
  Dio dio() {
    return DioClient(dio: Dio()).dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) {
    return ApiService(dio);
  }
}
