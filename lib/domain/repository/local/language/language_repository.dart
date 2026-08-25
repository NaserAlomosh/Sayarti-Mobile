
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/entity/local/language/get_user_languge_entity.dart';

abstract class LanguageRepository {

   Future<ApiResult<GetUserLanguageEntity>>getUserLanguge();

  Future<ApiResult<void>> saveUserLanguge(String languageCode);
}