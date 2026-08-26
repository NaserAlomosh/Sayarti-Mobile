abstract class AuthSessionStorage {
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<bool> hasTokens();

  Future<void> clearTokens();
}
