import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginContentEntity>> login(LoginUseCaseParams params);
}
