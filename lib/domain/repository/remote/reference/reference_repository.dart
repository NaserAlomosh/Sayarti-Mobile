import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/reference/country_entity.dart';

abstract class ReferenceRepository {
  Future<ApiResult<BaseResponseEntity<List<CountryEntity>>>> getCountries();
}
