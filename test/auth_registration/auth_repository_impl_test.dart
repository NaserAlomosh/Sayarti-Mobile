import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/dio.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/login/login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/register_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/resend_verification_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/verify_email_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/login_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/register_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/resend_verification_response_model.dart';
import 'package:sayarti_mobile/data/repository/remote/auth/auth_repository_impl.dart';
import 'package:sayarti_mobile/data/service/local/session/session_storage.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/register_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/resend_verification_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/verify_email_usecase.dart';

HttpResponse<T> _http<T>(T data, int status) => HttpResponse(data, Response(requestOptions: RequestOptions(path: '/'), statusCode: status));

class _Api implements ApiService {
  RegisterRequestModel? registered;
  VerifyEmailRequestModel? verified;
  ResendVerificationRequestModel? resent;
  late HttpResponse<RegisterResponseModel> registerResponse;
  late HttpResponse<LoginResponseModel> verifyResponse;
  late HttpResponse<ResendVerificationResponseModel> resendResponse;
  @override
  Future<HttpResponse<RegisterResponseModel>> register(RegisterRequestModel request) async { registered = request; return registerResponse; }
  @override
  Future<HttpResponse<LoginResponseModel>> verifyEmail(VerifyEmailRequestModel request) async { verified = request; return verifyResponse; }
  @override
  Future<HttpResponse<ResendVerificationResponseModel>> resendVerification(ResendVerificationRequestModel request) async { resent = request; return resendResponse; }
  @override
  Future<HttpResponse<LoginResponseModel>> login(LoginRequestModel request) => throw UnimplementedError();
}

class _Session extends SessionStorage {
  _Session() : super(const FlutterSecureStorage());
  LoginContentEntity? saved;
  @override
  Future<void> save(LoginContentEntity session) async { saved = session; }
}

Map<String, dynamic> get _authJson => {'success': true, 'data': {'accessToken': 'access', 'refreshToken': 'refresh', 'tokenType': 'Bearer', 'expiresIn': 3600, 'requiredAction': 'SELECT_COUNTRY', 'user': {'id': 'uuid', 'firstName': 'First', 'lastName': 'Last', 'email': 'user@example.com', 'emailVerified': true, 'authProvider': 'LOCAL', 'countryCode': 'JO', 'defaultCurrencyCode': 'JOD', 'preferredLanguage': 'en', 'createdAt': '2026-08-25T12:00:00Z', 'updatedAt': '2026-08-25T12:00:00Z'}}};

void main() {
  test('register builds request and maps SafeRequest success', () async {
    final api = _Api()..registerResponse = _http(RegisterResponseModel.fromJson({'success': true, 'data': {'email': 'user@example.com', 'verificationRequired': true}}), 201);
    final result = await AuthRepositoryImpl(api, _Session()).register(const RegisterUseCaseParams(firstName: 'First', lastName: 'Last', email: 'user@example.com', password: 'Password1', countryCode: 'JO'));
    expect(api.registered?.toJson(), {'firstName': 'First', 'lastName': 'Last', 'email': 'user@example.com', 'password': 'Password1', 'countryCode': 'JO'});
    result.when(success: (response) => expect(response.data?.verificationRequired, isTrue), failure: (error) => fail('$error'));
  });

  test('verify returns the mapped SafeRequest response without validation', () async {
    final api = _Api()..verifyResponse = _http(LoginResponseModel.fromJson(_authJson), 200);
    final storage = _Session();
    final result = await AuthRepositoryImpl(api, storage).verifyEmail(const VerifyEmailUseCaseParams(email: 'user@example.com', otp: '012345'));
    expect(api.verified?.toJson(), {'email': 'user@example.com', 'otp': '012345'});
    result.when(success: (response) => expect(response.data?.requiredAction, 'SELECT_COUNTRY'), failure: (error) => fail('$error'));
    expect(storage.saved, isNull);
  });

  test('resend builds request and maps accepted without inferring account state', () async {
    final api = _Api()..resendResponse = _http(ResendVerificationResponseModel.fromJson({'success': true, 'data': {'accepted': true}}), 200);
    final result = await AuthRepositoryImpl(api, _Session()).resendVerification(const ResendVerificationUseCaseParams(email: 'user@example.com'));
    expect(api.resent?.toJson(), {'email': 'user@example.com'});
    result.when(success: (response) => expect(response.data?.accepted, isTrue), failure: (error) => fail('$error'));
  });

  for (final entry in <(String, String)>[('register', 'AUTH_EMAIL_ALREADY_EXISTS'), ('register', 'VALIDATION_ERROR'), ('verify', 'AUTH_OTP_INVALID'), ('verify', 'AUTH_OTP_EXPIRED'), ('verify', 'AUTH_OTP_ATTEMPTS_EXCEEDED'), ('resend', 'AUTH_OTP_RESEND_TOO_SOON')]) {
    test('preserves ${entry.$2} through SafeRequest', () async {
      final api = _Api();
      final json = {'success': false, 'error': {'code': entry.$2, 'message': 'localized'}};
      if (entry.$1 == 'register') api.registerResponse = _http(RegisterResponseModel.fromJson(json), 409);
      if (entry.$1 == 'verify') api.verifyResponse = _http(LoginResponseModel.fromJson(json), 400);
      if (entry.$1 == 'resend') api.resendResponse = _http(ResendVerificationResponseModel.fromJson(json), 429);
      final repository = AuthRepositoryImpl(api, _Session());
      String? errorCode;
      if (entry.$1 == 'register') {
        final result = await repository.register(const RegisterUseCaseParams(firstName: 'F', lastName: 'L', email: 'e@x.com', password: 'Password1', countryCode: 'JO'));
        result.when(success: (_) => fail('expected failure'), failure: (error) => errorCode = error.code);
      } else if (entry.$1 == 'verify') {
        final result = await repository.verifyEmail(const VerifyEmailUseCaseParams(email: 'e@x.com', otp: '123456'));
        result.when(success: (_) => fail('expected failure'), failure: (error) => errorCode = error.code);
      } else {
        final result = await repository.resendVerification(const ResendVerificationUseCaseParams(email: 'e@x.com'));
        result.when(success: (_) => fail('expected failure'), failure: (error) => errorCode = error.code);
      }
      expect(errorCode, entry.$2);
    });
  }
}
