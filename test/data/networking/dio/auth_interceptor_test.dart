import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/networking/dio/auth_interceptor.dart';
import 'package:sayarti_mobile/domain/storage/auth/auth_session_storage.dart';

void main() {
  group('AuthInterceptor', () {
    test('attaches a stored access token and omits an absent token', () async {
      final storage = _FakeStorage(accessToken: 'access');
      final seenHeaders = <Object?>[];
      final dio = _buildDio(
        storage,
        appHandler: (options) {
          seenHeaders.add(options.headers[Headers.authorizationHeader]);
          return _jsonResponse(200, {'success': true});
        },
      );

      await dio.get<void>('v1/vehicles');
      storage.accessToken = null;
      await dio.get<void>('v1/vehicles');

      expect(seenHeaders, ['Bearer access', null]);
    });

    test('refreshes once, rotates both tokens, and retries with the new token',
        () async {
      final storage = _FakeStorage(
        accessToken: 'old-access',
        refreshToken: 'old-refresh',
      );
      var refreshCalls = 0;
      final requestTokens = <Object?>[];
      final dio = _buildDio(
        storage,
        appHandler: (options) {
          final token = options.headers[Headers.authorizationHeader];
          requestTokens.add(token);
          return token == 'Bearer new-access'
              ? _jsonResponse(200, {'success': true})
              : _jsonResponse(401, {'success': false});
        },
        refreshHandler: (options) {
          refreshCalls++;
          expect(jsonDecode(options.data as String), {
            'refreshToken': 'old-refresh',
          });
          return _successfulRefresh();
        },
      );

      await dio.get<void>('v1/vehicles');

      expect(refreshCalls, 1);
      expect(storage.accessToken, 'new-access');
      expect(storage.refreshToken, 'new-refresh');
      expect(storage.savedTokens, [('new-access', 'new-refresh')]);
      expect(requestTokens, ['Bearer old-access', 'Bearer new-access']);
    });

    test('clears tokens when refresh fails', () async {
      final storage = _FakeStorage(
        accessToken: 'old-access',
        refreshToken: 'old-refresh',
      );
      final dio = _buildDio(
        storage,
        appHandler: (_) => _jsonResponse(401, {'success': false}),
        refreshHandler: (_) => _jsonResponse(401, {'success': false}),
      );

      await expectLater(dio.get<void>('v1/vehicles'), throwsA(isA<DioException>()));
      expect(storage.clearCalls, 1);
      expect(storage.accessToken, isNull);
      expect(storage.refreshToken, isNull);
    });

    test('missing refresh token clears tokens without a refresh request', () async {
      final storage = _FakeStorage(accessToken: 'old-access');
      var refreshCalls = 0;
      final dio = _buildDio(
        storage,
        appHandler: (_) => _jsonResponse(401, {'success': false}),
        refreshHandler: (_) {
          refreshCalls++;
          return _successfulRefresh();
        },
      );

      await expectLater(dio.get<void>('v1/vehicles'), throwsA(isA<DioException>()));
      expect(refreshCalls, 0);
      expect(storage.clearCalls, 1);
    });

    test('a refresh endpoint 401 never invokes automatic refresh', () async {
      final storage = _FakeStorage(refreshToken: 'refresh');
      var refreshCalls = 0;
      final dio = _buildDio(
        storage,
        appHandler: (_) => _jsonResponse(401, {'success': false}),
        refreshHandler: (_) {
          refreshCalls++;
          return _successfulRefresh();
        },
      );

      await expectLater(
        dio.post<void>('v1/auth/refresh'),
        throwsA(isA<DioException>()),
      );
      expect(refreshCalls, 0);
    });

    test('a retried request that remains unauthorized is not refreshed again',
        () async {
      final storage = _FakeStorage(
        accessToken: 'old-access',
        refreshToken: 'old-refresh',
      );
      var refreshCalls = 0;
      var appCalls = 0;
      final dio = _buildDio(
        storage,
        appHandler: (_) {
          appCalls++;
          return _jsonResponse(401, {'success': false});
        },
        refreshHandler: (_) {
          refreshCalls++;
          return _successfulRefresh();
        },
      );

      await expectLater(dio.get<void>('v1/vehicles'), throwsA(isA<DioException>()));
      expect(refreshCalls, 1);
      expect(appCalls, 2);
    });

    test('concurrent 401s share one refresh and all retry with the new token',
        () async {
      final storage = _FakeStorage(
        accessToken: 'old-access',
        refreshToken: 'old-refresh',
      );
      var refreshCalls = 0;
      final retriedPaths = <String>[];
      final dio = _buildDio(
        storage,
        appHandler: (options) {
          if (options.headers[Headers.authorizationHeader] ==
              'Bearer new-access') {
            retriedPaths.add(options.path);
            return _jsonResponse(200, {'success': true});
          }
          return _jsonResponse(401, {'success': false});
        },
        refreshHandler: (_) async {
          refreshCalls++;
          await Future<void>.delayed(const Duration(milliseconds: 20));
          return _successfulRefresh();
        },
      );

      await Future.wait([
        dio.get<void>('v1/a'),
        dio.get<void>('v1/b'),
        dio.get<void>('v1/c'),
      ]);

      expect(refreshCalls, 1);
      expect(retriedPaths, containsAll(['v1/a', 'v1/b', 'v1/c']));
      expect(storage.savedTokens, [('new-access', 'new-refresh')]);
    });
  });
}

Dio _buildDio(
  _FakeStorage storage, {
  required FutureOr<ResponseBody> Function(RequestOptions) appHandler,
  FutureOr<ResponseBody> Function(RequestOptions)? refreshHandler,
}) {
  final dio = Dio(BaseOptions(baseUrl: 'https://example.test/api/'));
  final refreshDio = Dio()..options = dio.options.copyWith();
  dio.httpClientAdapter = _FakeAdapter(appHandler);
  refreshDio.httpClientAdapter = _FakeAdapter(
    refreshHandler ?? (_) => _jsonResponse(500, {}),
  );
  dio.interceptors.add(
    AuthInterceptor(
      sessionStorage: storage,
      applicationDio: dio,
      refreshDio: refreshDio,
    ),
  );
  return dio;
}

ResponseBody _successfulRefresh() => _jsonResponse(200, {
  'success': true,
  'data': {
    'accessToken': 'new-access',
    'refreshToken': 'new-refresh',
    'tokenType': 'Bearer',
    'expiresIn': 3600,
    'user': null,
    'requiredAction': null,
  },
});

ResponseBody _jsonResponse(int statusCode, Map<String, dynamic> body) =>
    ResponseBody.fromString(
      jsonEncode(body),
      statusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );

class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.handler);

  final FutureOr<ResponseBody> Function(RequestOptions) handler;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => handler(options);

  @override
  void close({bool force = false}) {}
}

class _FakeStorage implements AuthSessionStorage {
  _FakeStorage({this.accessToken, this.refreshToken});

  String? accessToken;
  String? refreshToken;
  int clearCalls = 0;
  final savedTokens = <(String, String)>[];

  @override
  Future<void> clearTokens() async {
    clearCalls++;
    accessToken = null;
    refreshToken = null;
  }

  @override
  Future<String?> getAccessToken() async => accessToken;

  @override
  Future<String?> getRefreshToken() async => refreshToken;

  @override
  Future<bool> hasTokens() async =>
      accessToken?.isNotEmpty == true && refreshToken?.isNotEmpty == true;

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    savedTokens.add((accessToken, refreshToken));
  }
}
