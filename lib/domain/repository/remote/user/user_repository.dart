import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/user_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/user/delete_user_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/user/change_default_currency_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/user/select_country_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/user/update_user_usecase.dart';

abstract class UserRepository {
  Future<ApiResult<BaseResponseEntity<UserEntity>>> getCurrentUser();

  Future<ApiResult<BaseResponseEntity<UserEntity>>> updateUser(
    UpdateUserUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<UserEntity>>> selectCountry(
    SelectCountryUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<UserEntity>>> changeDefaultCurrency(
    ChangeDefaultCurrencyUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<DeleteUserEntity>>> deleteAccount();
}
