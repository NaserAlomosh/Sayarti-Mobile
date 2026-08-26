import 'package:dio/dio.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/refresh/refresh_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/login_response_model.dart';
import 'package:sayarti_mobile/domain/storage/auth/auth_session_storage.dart';

/// Centralizes session authentication for the primary application Dio client.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this._sessionStorage,
    required this._applicationDio,
    required this._refreshDio,
  });

  static const _retriedKey = 'authInterceptorRetried';
  static const _refreshPath = 'v1/auth/refresh';
  static const _publicAuthPaths = <String>{
    'v1/auth/login',
    'v1/auth/register',
    'v1/auth/verify-email',
    'v1/auth/resend-verification',
    'v1/auth/google',
    _refreshPath,
  };

  final AuthSessionStorage _sessionStorage;
  final Dio _applicationDio;
  final Dio _refreshDio;

  Future<String?>? _refreshInFlight;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_isPublicAuthRequest(options)) {
      final accessToken = (await _sessionStorage.getAccessToken())?.trim();
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      } else {
        options.headers.remove('Authorization');
      }
    } else {
      options.headers.remove('Authorization');
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final request = err.requestOptions;
    if (err.response?.statusCode != 401 ||
        _isPublicAuthRequest(request) ||
        request.extra[_retriedKey] == true) {
      handler.next(err);
      return;
    }

    final currentAccessToken =
        (await _sessionStorage.getAccessToken())?.trim();
    final failedAccessToken = _bearerToken(
      request.headers['Authorization'],
    );

    // A concurrent request may have already rotated the tokens before this
    // error reached the interceptor. Reuse that result instead of refreshing
    // the newly rotated refresh token again.
    if (currentAccessToken != null &&
        currentAccessToken.isNotEmpty &&
        failedAccessToken != null &&
        failedAccessToken != currentAccessToken) {
      await _retry(err, currentAccessToken, handler);
      return;
    }

    try {
      final newAccessToken = await _singleFlightRefresh();
      if (newAccessToken == null) {
        handler.next(err);
        return;
      }
      await _retry(err, newAccessToken, handler);
    } catch (_) {
      handler.next(err);
    }
  }

  Future<String?> _singleFlightRefresh() {
    final existing = _refreshInFlight;
    if (existing != null) return existing;

    final refresh = _refreshSession();
    _refreshInFlight = refresh;
    refresh.whenComplete(() {
      if (identical(_refreshInFlight, refresh)) _refreshInFlight = null;
    });
    return refresh;
  }

  Future<String?> _refreshSession() async {
    final refreshToken = (await _sessionStorage.getRefreshToken())?.trim();
    if (refreshToken == null || refreshToken.isEmpty) {
      await _sessionStorage.clearTokens();
      return null;
    }

    try {
      final response = await _refreshDio.post<Map<String, dynamic>>(
        _refreshPath,
        data: RefreshRequestModel(refreshToken: refreshToken).toJson(),
      );
      final auth = LoginResponseModel.fromJson(response.data!).data;
      final accessToken = auth?.accessToken?.trim();
      final rotatedRefreshToken = auth?.refreshToken?.trim();
      if (accessToken == null ||
          accessToken.isEmpty ||
          rotatedRefreshToken == null ||
          rotatedRefreshToken.isEmpty) {
        await _sessionStorage.clearTokens();
        return null;
      }

      await _sessionStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: rotatedRefreshToken,
      );
      return accessToken;
    } catch (_) {
      await _sessionStorage.clearTokens();
      return null;
    }
  }

  Future<void> _retry(
    DioException originalError,
    String accessToken,
    ErrorInterceptorHandler handler,
  ) async {
    final request = originalError.requestOptions;
    request.extra[_retriedKey] = true;
    request.headers['Authorization'] = 'Bearer $accessToken';
    try {
      handler.resolve(await _applicationDio.fetch<dynamic>(request));
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  bool _isPublicAuthRequest(RequestOptions options) {
    final path = options.uri.path
        .replaceFirst(RegExp(r'^/api/'), '')
        .replaceFirst(RegExp(r'^/'), '')
        .toLowerCase();
    return _publicAuthPaths.contains(path);
  }

  String? _bearerToken(Object? header) {
    if (header is! String || !header.startsWith('Bearer ')) return null;
    return header.substring('Bearer '.length).trim();
  }
}
