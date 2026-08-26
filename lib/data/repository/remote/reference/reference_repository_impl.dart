import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/reference/country_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/reference/reference_repository.dart';

@LazySingleton(as: ReferenceRepository)
class ReferenceRepositoryImpl implements ReferenceRepository {
  const ReferenceRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<List<CountryEntity>>>> getCountries() =>
      SafeRequest.executeList<CountryEntity>(
        request: _apiService.getCountries(),
      );
}
