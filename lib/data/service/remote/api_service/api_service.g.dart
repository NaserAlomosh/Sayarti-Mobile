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
  Future<HttpResponse<LoginResponseModel>> login(
    LoginRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<LoginResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/auth/login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LoginResponseModel _value;
    try {
      _value = LoginResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<RegisterResponseModel>> register(
    RegisterRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<RegisterResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/auth/register',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RegisterResponseModel _value;
    try {
      _value = RegisterResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<VerifyEmailResponseModel>> verifyEmail(
    VerifyEmailRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<VerifyEmailResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/auth/verify-email',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VerifyEmailResponseModel _value;
    try {
      _value = VerifyEmailResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ResendVerificationResponseModel>> resendVerification(
    ResendVerificationRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<ResendVerificationResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(_dio.options, 'v1/auth/resend-verification', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ResendVerificationResponseModel _value;
    try {
      _value = ResendVerificationResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<LoginResponseModel>> googleLogin(
    GoogleLoginRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<LoginResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(_dio.options, 'v1/auth/google', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LoginResponseModel _value;
    try {
      _value = LoginResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<LoginResponseModel>> refresh(
    RefreshRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<LoginResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(_dio.options, 'v1/auth/refresh', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LoginResponseModel _value;
    try {
      _value = LoginResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<LogoutResponseModel>> logout(
    RefreshRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<LogoutResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(_dio.options, 'v1/auth/logout', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LogoutResponseModel _value;
    try {
      _value = LogoutResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<CountriesResponseModel>> getCountries() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<CountriesResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/reference/countries',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CountriesResponseModel _value;
    try {
      _value = CountriesResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CurrenciesResponseModel>> getCurrencies() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<CurrenciesResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(_dio.options, 'v1/reference/currencies', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CurrenciesResponseModel _value;
    try {
      _value = CurrenciesResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<UserResponseModel>> getCurrentUser() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<UserResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/users/me',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserResponseModel _value;
    try {
      _value = UserResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<UserResponseModel>> updateUser(
    UpdateUserRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<UserResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(_dio.options, 'v1/users/me', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserResponseModel _value;
    try {
      _value = UserResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<UserResponseModel>> selectCountry(
    SelectCountryRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<UserResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(_dio.options, 'v1/users/me/country', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserResponseModel _value;
    try {
      _value = UserResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<UserResponseModel>> changeDefaultCurrency(
    ChangeDefaultCurrencyRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<UserResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(_dio.options, 'v1/users/me/default-currency', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserResponseModel _value;
    try {
      _value = UserResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<DeleteUserResponseModel>> deleteAccount() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<DeleteUserResponseModel>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(_dio.options, 'v1/users/me', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteUserResponseModel _value;
    try {
      _value = DeleteUserResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return HttpResponse(_value, _result);
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

  @override
  Future<HttpResponse<VehicleResponseModel>> createVehicle(
    CreateVehicleRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};

    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<VehicleResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VehicleResponseModel _value;
    try { _value = VehicleResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<GetVehiclesResponseModel>> getVehicles(
    int page,
    int size,
    String? sortBy,
    String? sortDirection,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters[r'page'] = page;
    queryParameters[r'size'] = size;
    if (sortBy != null) queryParameters[r'sortBy'] = sortBy;
    if (sortDirection != null) queryParameters[r'sortDirection'] = sortDirection;
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<GetVehiclesResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetVehiclesResponseModel _value;
    try { _value = GetVehiclesResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<VehicleResponseModel>> getVehicleDetails(
    String vehicleId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};

    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<VehicleResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VehicleResponseModel _value;
    try { _value = VehicleResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<VehicleResponseModel>> updateVehicle(
    String vehicleId,
    UpdateVehicleRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};

    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<VehicleResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VehicleResponseModel _value;
    try { _value = VehicleResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<VehicleResponseModel>> updateVehicleMileage(
    String vehicleId,
    UpdateMileageRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};

    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<VehicleResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/mileage', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VehicleResponseModel _value;
    try { _value = VehicleResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<DeleteVehicleResponseModel>> deleteVehicle(
    String vehicleId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};

    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<DeleteVehicleResponseModel>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteVehicleResponseModel _value;
    try { _value = DeleteVehicleResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<FuelRecordResponseModel>> createFuelRecord(String vehicleId, CreateFuelRecordRequestModel request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<FuelRecordResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/fuel-records', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FuelRecordResponseModel _value;
    try { _value = FuelRecordResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<GetFuelRecordsResponseModel>> getFuelRecords(String vehicleId, int page, int size, String? sortBy, String? sortDirection, DateTime? from, DateTime? to) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters[r'page'] = page;
    queryParameters[r'size'] = size;
    if (sortBy != null) queryParameters[r'sortBy'] = sortBy;
    if (sortDirection != null) queryParameters[r'sortDirection'] = sortDirection;
    if (from != null) queryParameters[r'from'] = from.toIso8601String();
    if (to != null) queryParameters[r'to'] = to.toIso8601String();
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<GetFuelRecordsResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/fuel-records', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetFuelRecordsResponseModel _value;
    try { _value = GetFuelRecordsResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<FuelRecordResponseModel>> getFuelRecord(String vehicleId, String fuelRecordId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<FuelRecordResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/fuel-records/${fuelRecordId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FuelRecordResponseModel _value;
    try { _value = FuelRecordResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<FuelSummaryResponseModel>> getFuelSummary(String vehicleId, String? month) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    if (month != null) queryParameters[r'month'] = month;
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<FuelSummaryResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/fuel-records/summary', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FuelSummaryResponseModel _value;
    try { _value = FuelSummaryResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<FuelRecordResponseModel>> updateFuelRecord(String vehicleId, String fuelRecordId, UpdateFuelRecordRequestModel request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<FuelRecordResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/fuel-records/${fuelRecordId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FuelRecordResponseModel _value;
    try { _value = FuelRecordResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<DeleteFuelRecordResponseModel>> deleteFuelRecord(String vehicleId, String fuelRecordId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<DeleteFuelRecordResponseModel>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/fuel-records/${fuelRecordId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteFuelRecordResponseModel _value;
    try { _value = DeleteFuelRecordResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<MaintenanceRecordResponseModel>> createMaintenanceRecord(String vehicleId, CreateMaintenanceRecordRequestModel request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<MaintenanceRecordResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/maintenance-records', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MaintenanceRecordResponseModel _value;
    try { _value = MaintenanceRecordResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<GetMaintenanceRecordsResponseModel>> getMaintenanceRecords(String vehicleId, int page, int size, String? sortBy, String? sortDirection, DateTime? from, DateTime? to) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters[r'page'] = page;
    queryParameters[r'size'] = size;
    if (sortBy != null) queryParameters[r'sortBy'] = sortBy;
    if (sortDirection != null) queryParameters[r'sortDirection'] = sortDirection;
    if (from != null) queryParameters[r'from'] = from.toIso8601String();
    if (to != null) queryParameters[r'to'] = to.toIso8601String();
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<GetMaintenanceRecordsResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/maintenance-records', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetMaintenanceRecordsResponseModel _value;
    try { _value = GetMaintenanceRecordsResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<MaintenanceRecordResponseModel>> getMaintenanceRecord(String vehicleId, String maintenanceRecordId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<MaintenanceRecordResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/maintenance-records/${maintenanceRecordId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MaintenanceRecordResponseModel _value;
    try { _value = MaintenanceRecordResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<MaintenanceRecordResponseModel>> updateMaintenanceRecord(String vehicleId, String maintenanceRecordId, UpdateMaintenanceRecordRequestModel request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<MaintenanceRecordResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/maintenance-records/${maintenanceRecordId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MaintenanceRecordResponseModel _value;
    try { _value = MaintenanceRecordResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<DeleteMaintenanceRecordResponseModel>> deleteMaintenanceRecord(String vehicleId, String maintenanceRecordId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<DeleteMaintenanceRecordResponseModel>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/maintenance-records/${maintenanceRecordId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteMaintenanceRecordResponseModel _value;
    try { _value = DeleteMaintenanceRecordResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<ExpenseResponseModel>> createExpense(String vehicleId, CreateExpenseRequestModel request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<ExpenseResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/expenses', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ExpenseResponseModel _value;
    try { _value = ExpenseResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<GetExpensesResponseModel>> getExpenses(String vehicleId, int page, int size, String? sortBy, String? sortDirection, DateTime? from, DateTime? to) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters[r'page'] = page;
    queryParameters[r'size'] = size;
    if (sortBy != null) queryParameters[r'sortBy'] = sortBy;
    if (sortDirection != null) queryParameters[r'sortDirection'] = sortDirection;
    if (from != null) queryParameters[r'from'] = from.toIso8601String();
    if (to != null) queryParameters[r'to'] = to.toIso8601String();
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<GetExpensesResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/expenses', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetExpensesResponseModel _value;
    try { _value = GetExpensesResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<ExpenseResponseModel>> getExpense(String vehicleId, String expenseId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<ExpenseResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/expenses/${expenseId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ExpenseResponseModel _value;
    try { _value = ExpenseResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<ExpenseResponseModel>> updateExpense(String vehicleId, String expenseId, UpdateExpenseRequestModel request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<ExpenseResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/expenses/${expenseId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ExpenseResponseModel _value;
    try { _value = ExpenseResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<DeleteExpenseResponseModel>> deleteExpense(String vehicleId, String expenseId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<DeleteExpenseResponseModel>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/expenses/${expenseId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteExpenseResponseModel _value;
    try { _value = DeleteExpenseResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<ReminderResponseModel>> createReminder(String vehicleId, CreateReminderRequestModel request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<ReminderResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/reminders', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ReminderResponseModel _value;
    try { _value = ReminderResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<GetRemindersResponseModel>> getReminders(String vehicleId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<GetRemindersResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/reminders', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetRemindersResponseModel _value;
    try { _value = GetRemindersResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<ReminderResponseModel>> getReminder(String vehicleId, String reminderId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<ReminderResponseModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/reminders/${reminderId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ReminderResponseModel _value;
    try { _value = ReminderResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<ReminderResponseModel>> updateReminder(String vehicleId, String reminderId, UpdateReminderRequestModel request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<ReminderResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/reminders/${reminderId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ReminderResponseModel _value;
    try { _value = ReminderResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<ReminderResponseModel>> completeReminder(String vehicleId, String reminderId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<ReminderResponseModel>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/reminders/${reminderId}/complete', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ReminderResponseModel _value;
    try { _value = ReminderResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
  }

  @override
  Future<HttpResponse<DeleteReminderResponseModel>> deleteReminder(String vehicleId, String reminderId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _options = _setStreamType<HttpResponse<DeleteReminderResponseModel>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra).compose(_dio.options, 'v1/vehicles/${vehicleId}/reminders/${reminderId}', queryParameters: queryParameters, data: _data).copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteReminderResponseModel _value;
    try { _value = DeleteReminderResponseModel.fromJson(_result.data!); } on Object catch (e, st) { errorLogger?.logError(e, st, _options, response: _result); rethrow; }
    return HttpResponse(_value, _result);
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
