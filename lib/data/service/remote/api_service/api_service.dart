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
import 'package:sayarti_mobile/data/model/remote/request/vehicle/create_vehicle_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/vehicle/update_mileage_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/vehicle/update_vehicle_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/vehicle/delete_vehicle_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/vehicle/get_vehicles_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/vehicle/vehicle_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/fuel/create_fuel_record_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/fuel/update_fuel_record_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/fuel/delete_fuel_record_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/fuel/fuel_record_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/fuel/fuel_summary_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/fuel/get_fuel_records_response_model.dart';

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

  @POST('v1/vehicles')
  Future<HttpResponse<VehicleResponseModel>> createVehicle(
    @Body() CreateVehicleRequestModel request,
  );

  @GET('v1/vehicles')
  Future<HttpResponse<GetVehiclesResponseModel>> getVehicles(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sortBy') String? sortBy,
    @Query('sortDirection') String? sortDirection,
  );

  @GET('v1/vehicles/{vehicleId}')
  Future<HttpResponse<VehicleResponseModel>> getVehicleDetails(
    @Path('vehicleId') String vehicleId,
  );

  @PATCH('v1/vehicles/{vehicleId}')
  Future<HttpResponse<VehicleResponseModel>> updateVehicle(
    @Path('vehicleId') String vehicleId,
    @Body() UpdateVehicleRequestModel request,
  );

  @PATCH('v1/vehicles/{vehicleId}/mileage')
  Future<HttpResponse<VehicleResponseModel>> updateVehicleMileage(
    @Path('vehicleId') String vehicleId,
    @Body() UpdateMileageRequestModel request,
  );

  @DELETE('v1/vehicles/{vehicleId}')
  Future<HttpResponse<DeleteVehicleResponseModel>> deleteVehicle(
    @Path('vehicleId') String vehicleId,
  );

  @POST('v1/vehicles/{vehicleId}/fuel-records')
  Future<HttpResponse<FuelRecordResponseModel>> createFuelRecord(@Path('vehicleId') String vehicleId, @Body() CreateFuelRecordRequestModel request);

  @GET('v1/vehicles/{vehicleId}/fuel-records')
  Future<HttpResponse<GetFuelRecordsResponseModel>> getFuelRecords(@Path('vehicleId') String vehicleId, @Query('page') int page, @Query('size') int size, @Query('sortBy') String? sortBy, @Query('sortDirection') String? sortDirection, @Query('from') DateTime? from, @Query('to') DateTime? to);

  @GET('v1/vehicles/{vehicleId}/fuel-records/{fuelRecordId}')
  Future<HttpResponse<FuelRecordResponseModel>> getFuelRecord(@Path('vehicleId') String vehicleId, @Path('fuelRecordId') String fuelRecordId);

  @GET('v1/vehicles/{vehicleId}/fuel-records/summary')
  Future<HttpResponse<FuelSummaryResponseModel>> getFuelSummary(@Path('vehicleId') String vehicleId, @Query('month') String? month);

  @PATCH('v1/vehicles/{vehicleId}/fuel-records/{fuelRecordId}')
  Future<HttpResponse<FuelRecordResponseModel>> updateFuelRecord(@Path('vehicleId') String vehicleId, @Path('fuelRecordId') String fuelRecordId, @Body() UpdateFuelRecordRequestModel request);

  @DELETE('v1/vehicles/{vehicleId}/fuel-records/{fuelRecordId}')
  Future<HttpResponse<DeleteFuelRecordResponseModel>> deleteFuelRecord(@Path('vehicleId') String vehicleId, @Path('fuelRecordId') String fuelRecordId);
}
