import 'package:sayarti_mobile/data/model/remote/request/auth/login/login_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/error/app_error.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_local_request.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/local/session/session_storage.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._apiService, this._sessionStorage);
  final ApiService _apiService;
  final SessionStorage _sessionStorage;

  @override
  Future<ApiResult<LoginContentEntity>> login(LoginUseCaseParams params) async {
    final remote = await SafeRequest.execute<LoginContentEntity>(
      request: _apiService.login(
        LoginRequestModel(email: params.email, password: params.password),
      ),
    );

    return remote.when(
      success: (response) async {
        final entity = response.data;
        if (entity == null) {
          return const ApiResult.failure(
            ApiErrorModel(message: 'Invalid login response.'),
          );
        }

        final persisted = await SafeLocalRequest.executeVoid(
          request: () => _sessionStorage.save(entity),
        );
        return persisted.when(
          success: (_) => ApiResult.success(entity),
          failure: ApiResult.failure,
        );
      },
      failure: (error) async => ApiResult.failure(error),
    );
  }
}
