import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/local/language/get_user_languge_entity.dart';
import 'package:sayarti_mobile/domain/repository/local/language/language_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserLanguageUsecase
    extends BaseLocalUsecase<GetUserLanguageEntity, GetUserLanguageParams> {
  GetUserLanguageUsecase(this._languageRepository);

  final LanguageRepository _languageRepository;

  @override
  Future<ApiResult<GetUserLanguageEntity>> call(GetUserLanguageParams params) {
    return _languageRepository.getUserLanguge();
  }
}

class GetUserLanguageParams extends BaseUsecaseParams {
  const GetUserLanguageParams();
}
