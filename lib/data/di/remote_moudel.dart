import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/dio/dio_client.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/storage/auth/auth_session_storage.dart';

@module
abstract class RemoteMoudel {
  @lazySingleton
  Dio dio(AuthSessionStorage sessionStorage) {
    return DioClient(dio: Dio(), sessionStorage: sessionStorage).dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) {
    return ApiService(dio);
  }
}
