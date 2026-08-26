// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<LoginResponseModel>> login(LoginRequestModel request) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(request.toJson());
    final options = _setStreamType<LoginResponseModel>(
      Options(method: 'POST', headers: headers, extra: extra)
          .compose(_dio.options, 'v1/auth/login', queryParameters: queryParameters, data: data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final result = await _dio.fetch<Map<String, dynamic>>(options);
    late LoginResponseModel value;
    try {
      value = LoginResponseModel.fromJson(result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, options);
      rethrow;
    }
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<RegisterResponseModel>> register(RegisterRequestModel request) async {
    final options = _setStreamType<RegisterResponseModel>(Options(method: 'POST').compose(_dio.options, 'v1/auth/register', data: request.toJson()).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)));
    final result = await _dio.fetch<Map<String, dynamic>>(options);
    return HttpResponse(RegisterResponseModel.fromJson(result.data!), result);
  }

  @override
  Future<HttpResponse<LoginResponseModel>> verifyEmail(VerifyEmailRequestModel request) async {
    final options = _setStreamType<LoginResponseModel>(Options(method: 'POST').compose(_dio.options, 'v1/auth/verify-email', data: request.toJson()).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)));
    final result = await _dio.fetch<Map<String, dynamic>>(options);
    return HttpResponse(LoginResponseModel.fromJson(result.data!), result);
  }

  @override
  Future<HttpResponse<ResendVerificationResponseModel>> resendVerification(ResendVerificationRequestModel request) async {
    final options = _setStreamType<ResendVerificationResponseModel>(Options(method: 'POST').compose(_dio.options, 'v1/auth/resend-verification', data: request.toJson()).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)));
    final result = await _dio.fetch<Map<String, dynamic>>(options);
    return HttpResponse(ResendVerificationResponseModel.fromJson(result.data!), result);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
