import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/storage/auth/auth_session_storage_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const secureStorage = FlutterSecureStorage();
  const storage = AuthSessionStorageImpl(secureStorage);

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  test('missing token values return null', () async {
    expect(await storage.getAccessToken(), isNull);
    expect(await storage.getRefreshToken(), isNull);
  });

  test('saveTokens stores and returns both token values', () async {
    await storage.saveTokens(
      accessToken: 'access-token',
      refreshToken: 'refresh-token',
    );

    expect(await storage.getAccessToken(), 'access-token');
    expect(await storage.getRefreshToken(), 'refresh-token');
    expect(await storage.hasTokens(), isTrue);
  });

  test('saving a new token pair replaces both previous values', () async {
    await storage.saveTokens(
      accessToken: 'old-access-token',
      refreshToken: 'old-refresh-token',
    );

    await storage.saveTokens(
      accessToken: 'new-access-token',
      refreshToken: 'new-refresh-token',
    );

    expect(await storage.getAccessToken(), 'new-access-token');
    expect(await storage.getRefreshToken(), 'new-refresh-token');
  });

  test('hasTokens requires both non-empty tokens', () async {
    FlutterSecureStorage.setMockInitialValues({
      'auth_access_token': 'access-token',
    });
    expect(await storage.hasTokens(), isFalse);

    FlutterSecureStorage.setMockInitialValues({
      'auth_refresh_token': 'refresh-token',
    });
    expect(await storage.hasTokens(), isFalse);

    FlutterSecureStorage.setMockInitialValues({
      'auth_access_token': ' ',
      'auth_refresh_token': 'refresh-token',
    });
    expect(await storage.hasTokens(), isFalse);
  });

  test(
    'clearTokens removes both tokens without clearing other values',
    () async {
      FlutterSecureStorage.setMockInitialValues({'unrelated_key': 'keep-me'});
      await storage.saveTokens(
        accessToken: 'access-token',
        refreshToken: 'refresh-token',
      );

      await storage.clearTokens();

      expect(await storage.getAccessToken(), isNull);
      expect(await storage.getRefreshToken(), isNull);
      expect(await storage.hasTokens(), isFalse);
      expect(await secureStorage.read(key: 'unrelated_key'), 'keep-me');
    },
  );
}
