import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/domain/storage/auth/auth_session_storage.dart';

@LazySingleton(as: AuthSessionStorage)
class AuthSessionStorageImpl implements AuthSessionStorage {
  const AuthSessionStorageImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static const _accessTokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() =>
      _secureStorage.read(key: _accessTokenKey);

  @override
  Future<String?> getRefreshToken() =>
      _secureStorage.read(key: _refreshTokenKey);

  @override
  Future<bool> hasTokens() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();

    return accessToken != null &&
        accessToken.trim().isNotEmpty &&
        refreshToken != null &&
        refreshToken.trim().isNotEmpty;
  }

  @override
  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }
}
