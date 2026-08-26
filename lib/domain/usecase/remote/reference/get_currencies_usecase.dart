import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/reference/currency_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/reference/reference_repository.dart';

@lazySingleton
class GetCurrenciesUseCase {
  const GetCurrenciesUseCase(this._repository);
  final ReferenceRepository _repository;

  Future<ApiResult<BaseResponseEntity<List<CurrencyEntity>>>> call() =>
      _repository.getCurrencies();
}
