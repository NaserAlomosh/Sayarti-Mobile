import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/login/login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/google_login/google_login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/refresh/refresh_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/resend_verification/resend_verification_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/register_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/verify_email/verify_email_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/login_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/logout/logout_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/resend_verification/resend_verification_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/register_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/verify_email/verify_email_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reference/countries/countries_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reference/currencies/currencies_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/user/change_default_currency/change_default_currency_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/user/select_country/select_country_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/user/update_user/update_user_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/user/delete_user/delete_user_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/user/user_response_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST('v1/auth/login')
  Future<HttpResponse<LoginResponseModel>> login(
    @Body() LoginRequestModel request,
  );

  @POST('v1/auth/register')
  Future<HttpResponse<RegisterResponseModel>> register(
    @Body() RegisterRequestModel request,
  );

  @POST('v1/auth/verify-email')
  Future<HttpResponse<VerifyEmailResponseModel>> verifyEmail(
    @Body() VerifyEmailRequestModel request,
  );

  @POST('v1/auth/resend-verification')
  Future<HttpResponse<ResendVerificationResponseModel>> resendVerification(
    @Body() ResendVerificationRequestModel request,
  );

  @POST('v1/auth/google')
  Future<HttpResponse<LoginResponseModel>> googleLogin(
    @Body() GoogleLoginRequestModel request,
  );

  @POST('v1/auth/refresh')
  Future<HttpResponse<LoginResponseModel>> refresh(
    @Body() RefreshRequestModel request,
  );

  @POST('v1/auth/logout')
  Future<HttpResponse<LogoutResponseModel>> logout(
    @Body() RefreshRequestModel request,
  );

  @GET('v1/reference/countries')
  Future<HttpResponse<CountriesResponseModel>> getCountries();

  @GET('v1/reference/currencies')
  Future<HttpResponse<CurrenciesResponseModel>> getCurrencies();

  @GET('v1/users/me')
  Future<HttpResponse<UserResponseModel>> getCurrentUser();

  @PATCH('v1/users/me')
  Future<HttpResponse<UserResponseModel>> updateUser(
    @Body() UpdateUserRequestModel request,
  );

  @PATCH('v1/users/me/country')
  Future<HttpResponse<UserResponseModel>> selectCountry(
    @Body() SelectCountryRequestModel request,
  );

  @PATCH('v1/users/me/default-currency')
  Future<HttpResponse<UserResponseModel>> changeDefaultCurrency(
    @Body() ChangeDefaultCurrencyRequestModel request,
  );

  @DELETE('v1/users/me')
  Future<HttpResponse<DeleteUserResponseModel>> deleteAccount();
}
