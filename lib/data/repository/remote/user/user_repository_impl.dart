import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/model/remote/request/user/change_default_currency/change_default_currency_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/user/select_country/select_country_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/user/update_user/update_user_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/user_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/user/delete_user_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/user/user_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/user/change_default_currency_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/user/select_country_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/user/update_user_usecase.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<UserEntity>>> getCurrentUser() =>
      SafeRequest.execute<UserEntity>(request: _apiService.getCurrentUser());

  @override
  Future<ApiResult<BaseResponseEntity<UserEntity>>> updateUser(
    UpdateUserUseCaseParams params,
  ) => SafeRequest.execute<UserEntity>(
    request: _apiService.updateUser(
      UpdateUserRequestModel(
        firstName: params.firstName,
        lastName: params.lastName,
        preferredLanguage: params.preferredLanguage,
      ),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<UserEntity>>> selectCountry(
    SelectCountryUseCaseParams params,
  ) => SafeRequest.execute<UserEntity>(
    request: _apiService.selectCountry(
      SelectCountryRequestModel(countryCode: params.countryCode),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<UserEntity>>> changeDefaultCurrency(
    ChangeDefaultCurrencyUseCaseParams params,
  ) => SafeRequest.execute<UserEntity>(
    request: _apiService.changeDefaultCurrency(
      ChangeDefaultCurrencyRequestModel(currencyCode: params.currencyCode),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<DeleteUserEntity>>> deleteAccount() =>
      SafeRequest.execute<DeleteUserEntity>(
        request: _apiService.deleteAccount(),
      );
}
