import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/login/login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/login_response_model.dart';

void main() {
  test('serializes the exact login request contract', () {
    const model = LoginRequestModel(email: 'user@example.com', password: 'secret');
    expect(model.toJson(), {'email': 'user@example.com', 'password': 'secret'});
  });

  for (final action in <String?>[null, 'SELECT_COUNTRY']) {
    test('parses login response with requiredAction $action and nullable country', () {
      final response = LoginResponseModel.fromJson({
        'success': true,
        'data': {
          'accessToken': 'access', 'refreshToken': 'refresh', 'tokenType': 'Bearer',
          'expiresIn': 3600, 'requiredAction': action,
          'user': {
            'id': 'id', 'firstName': 'A', 'lastName': 'B', 'email': 'user@example.com',
            'emailVerified': true, 'authProvider': 'LOCAL', 'countryCode': null,
            'defaultCurrencyCode': null, 'preferredLanguage': 'en',
            'createdAt': '2026-08-25T12:00:00Z', 'updatedAt': '2026-08-25T12:00:00Z',
          },
        },
        'message': null,
      });
      final entity = response.data!.toEntity();
      expect(response.success, isTrue);
      expect(entity.accessToken, 'access');
      expect(entity.refreshToken, 'refresh');
      expect(entity.tokenType, 'Bearer');
      expect(entity.expiresIn, 3600);
      expect(entity.requiredAction, action);
      expect(entity.user.countryCode, isNull);
      expect(entity.user.defaultCurrencyCode, isNull);
      expect(entity.user.createdAt, DateTime.utc(2026, 8, 25, 12));
    });
  }

  for (final code in ['AUTH_INVALID_CREDENTIALS', 'AUTH_EMAIL_NOT_VERIFIED', 'VALIDATION_ERROR']) {
    test('parses $code error', () {
      final response = LoginResponseModel.fromJson({
        'success': false,
        'error': {'code': code, 'message': 'localized', 'details': {'email': 'invalid'}},
      });
      expect(response.error?.code, code);
      expect(response.error?.details['email'], 'invalid');
    });
  }
}
