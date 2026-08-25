import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_local_request.dart';
import 'package:sayarti_mobile/domain/entity/local/language/get_user_languge_entity.dart';
import 'package:sayarti_mobile/domain/repository/local/language/language_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl implements LanguageRepository {
  LanguageRepositoryImpl(
    // this._storgeManager,
    );

   late dynamic _storgeManager;

  static const String _languageKey = 'language';

  @override
  Future<ApiResult<GetUserLanguageEntity>> getUserLanguge() {
    return SafeLocalRequest.execute<GetUserLanguageEntity>(
      request: () async {
        final storedLanguageCode = await _storgeManager.getString(_languageKey);
        final languageCode = _resolveLanguageCode(storedLanguageCode);
        return GetUserLanguageEntity(code: languageCode);
      },
    );
  }

  @override
  Future<ApiResult<void>> saveUserLanguge(String languageCode) {
    return SafeLocalRequest.execute<void>(
      request: () async {
        await _storgeManager.setString(key: _languageKey, value: languageCode);
      },
    );
  }

  String _resolveLanguageCode(String? storedLanguageCode) {
    final normalizedCode = storedLanguageCode?.trim();

    if (normalizedCode != null && normalizedCode.isNotEmpty) {
      return normalizedCode;
    }

    return WidgetsBinding.instance.platformDispatcher.locale.languageCode;
  }
}
