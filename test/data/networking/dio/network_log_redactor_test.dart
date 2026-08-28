import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/networking/dio/network_log_redactor.dart';

void main() {
  test('redacts authentication secrets without changing safe fields', () {
    const password = 'actual-password';
    const accessToken = 'actual-access-token';
    const refreshToken = 'actual-refresh-token';
    const bearerToken = 'actual-bearer-token';
    const log = '''
{"email":"naser@example.com","password":"$password","otp":"123456"}
{"accessToken":"$accessToken","refreshToken":"$refreshToken"}
Authorization: Bearer $bearerToken
idToken: actual-google-token, fcmToken: actual-fcm-token
''';

    final redacted = redactNetworkLog(log);

    expect(redacted, contains('naser@example.com'));
    expect(redacted, contains('***'));
    for (final secret in [
      password,
      accessToken,
      refreshToken,
      bearerToken,
      '123456',
      'actual-google-token',
      'actual-fcm-token',
    ]) {
      expect(redacted, isNot(contains(secret)));
    }
  });
}
