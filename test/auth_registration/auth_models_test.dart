import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/register_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/resend_verification_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/verify_email_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/login_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/register_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/resend_verification_response_model.dart';

void main() {
  test('register request serializes the exact backend fields', () {
    const model = RegisterRequestModel(firstName: 'Naser', lastName: 'Alomosh', email: 'user@example.com', password: 'Password1', countryCode: 'JO');
    expect(model.toJson(), {'firstName': 'Naser', 'lastName': 'Alomosh', 'email': 'user@example.com', 'password': 'Password1', 'countryCode': 'JO'});
  });

  test('register response parses and maps to its entity', () {
    final response = RegisterResponseModel.fromJson({'success': true, 'data': {'email': 'user@example.com', 'verificationRequired': true}, 'message': 'Email verification required'});
    final entity = response.data!.toEntity();
    expect(entity.email, 'user@example.com');
    expect(entity.verificationRequired, isTrue);
    expect(response.message, 'Email verification required');
  });

  test('verify request preserves an OTP with a leading zero as a String', () {
    const model = VerifyEmailRequestModel(email: 'user@example.com', otp: '012345');
    expect(model.toJson(), {'email': 'user@example.com', 'otp': '012345'});
    expect(model.toJson()['otp'], isA<String>());
  });

  for (final action in <String?>[null, 'SELECT_COUNTRY']) {
    test('verify response reuses auth mapping with requiredAction $action', () {
      final response = LoginResponseModel.fromJson({'success': true, 'data': {'accessToken': 'access', 'refreshToken': 'refresh', 'tokenType': 'Bearer', 'expiresIn': 7210, 'requiredAction': action, 'user': {'id': 'uuid', 'firstName': 'First', 'lastName': 'Last', 'email': 'user@example.com', 'emailVerified': true, 'authProvider': 'LOCAL', 'countryCode': null, 'defaultCurrencyCode': null, 'preferredLanguage': 'en', 'createdAt': '2026-08-25T12:00:00Z', 'updatedAt': '2026-08-25T12:00:00Z'}}, 'message': 'Email verified'});
      final entity = response.data!.toEntity();
      expect(entity.accessToken, 'access'); expect(entity.refreshToken, 'refresh'); expect(entity.tokenType, 'Bearer'); expect(entity.expiresIn, 7210); expect(entity.requiredAction, action);
      expect(entity.user.countryCode, isNull); expect(entity.user.defaultCurrencyCode, isNull);
    });
  }

  test('resend request serializes only email and response maps accepted', () {
    const request = ResendVerificationRequestModel(email: 'user@example.com');
    expect(request.toJson(), {'email': 'user@example.com'});
    final response = ResendVerificationResponseModel.fromJson({'success': true, 'data': {'accepted': true}, 'message': 'If the account is eligible, a verification email has been requested'});
    expect(response.data!.toEntity().accepted, isTrue);
  });
}
