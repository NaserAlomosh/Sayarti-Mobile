import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/repository/local/language/language_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveUserLanguageUsecase
    extends BaseLocalUsecase<void, SaveUserLanguageParams> {
  SaveUserLanguageUsecase(this._languageRepository);

  final LanguageRepository _languageRepository;

  @override
  Future<ApiResult<void>> call(SaveUserLanguageParams params) {
    return _languageRepository.saveUserLanguge(params.languageCode);
  }
}

class SaveUserLanguageParams extends BaseUsecaseParams {
  const SaveUserLanguageParams({required this.languageCode});

  final String languageCode;
}
