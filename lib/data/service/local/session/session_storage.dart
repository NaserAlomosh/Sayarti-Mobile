import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';

class SessionStorage {
  SessionStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'session.accessToken';
  static const _refreshTokenKey = 'session.refreshToken';
  static const _tokenTypeKey = 'session.tokenType';
  static const _expiresInKey = 'session.expiresIn';
  static const _requiredActionKey = 'session.requiredAction';

  Future<void> save(LoginContentEntity session) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: session.accessToken),
      _storage.write(key: _refreshTokenKey, value: session.refreshToken),
      _storage.write(key: _tokenTypeKey, value: session.tokenType),
      _storage.write(key: _expiresInKey, value: session.expiresIn.toString()),
      _storage.write(key: _requiredActionKey, value: session.requiredAction),
    ]);
  }
}
