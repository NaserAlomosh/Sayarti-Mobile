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
import 'package:sayarti_mobile/data/model/remote/request/maintenance/create_maintenance_record_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/maintenance/update_maintenance_record_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/maintenance/delete_maintenance_record_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/maintenance/get_maintenance_records_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/maintenance/maintenance_record_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/expense/create_expense_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/expense/update_expense_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/expense/delete_expense_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/expense/expense_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/expense/get_expenses_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/reminder/create_reminder_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/reminder/update_reminder_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reminder/delete_reminder_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reminder/get_reminders_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reminder/reminder_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/device/register_device_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/device/update_fcm_token_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/device/delete_device_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/device/device_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/expense_statistics_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/fuel_statistics_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/general_statistics_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/maintenance_statistics_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/true_vehicle_cost_response_model.dart';

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

  @POST('v1/vehicles/{vehicleId}/maintenance-records')
  Future<HttpResponse<MaintenanceRecordResponseModel>> createMaintenanceRecord(
    @Path('vehicleId') String vehicleId,
    @Body() CreateMaintenanceRecordRequestModel request,
  );

  @GET('v1/vehicles/{vehicleId}/maintenance-records')
  Future<HttpResponse<GetMaintenanceRecordsResponseModel>>
  getMaintenanceRecords(
    @Path('vehicleId') String vehicleId,
    @Query('page') int page,
    @Query('size') int size,
    @Query('sortBy') String? sortBy,
    @Query('sortDirection') String? sortDirection,
    @Query('from') DateTime? from,
    @Query('to') DateTime? to,
  );

  @GET(
    'v1/vehicles/{vehicleId}/maintenance-records/{maintenanceRecordId}',
  )
  Future<HttpResponse<MaintenanceRecordResponseModel>> getMaintenanceRecord(
    @Path('vehicleId') String vehicleId,
    @Path('maintenanceRecordId') String maintenanceRecordId,
  );

  @PATCH(
    'v1/vehicles/{vehicleId}/maintenance-records/{maintenanceRecordId}',
  )
  Future<HttpResponse<MaintenanceRecordResponseModel>> updateMaintenanceRecord(
    @Path('vehicleId') String vehicleId,
    @Path('maintenanceRecordId') String maintenanceRecordId,
    @Body() UpdateMaintenanceRecordRequestModel request,
  );

  @DELETE(
    'v1/vehicles/{vehicleId}/maintenance-records/{maintenanceRecordId}',
  )
  Future<HttpResponse<DeleteMaintenanceRecordResponseModel>>
  deleteMaintenanceRecord(
    @Path('vehicleId') String vehicleId,
    @Path('maintenanceRecordId') String maintenanceRecordId,
  );

  @POST('v1/vehicles/{vehicleId}/expenses')
  Future<HttpResponse<ExpenseResponseModel>> createExpense(
    @Path('vehicleId') String vehicleId,
    @Body() CreateExpenseRequestModel request,
  );

  @GET('v1/vehicles/{vehicleId}/expenses')
  Future<HttpResponse<GetExpensesResponseModel>> getExpenses(
    @Path('vehicleId') String vehicleId,
    @Query('page') int page,
    @Query('size') int size,
    @Query('sortBy') String? sortBy,
    @Query('sortDirection') String? sortDirection,
    @Query('from') DateTime? from,
    @Query('to') DateTime? to,
  );

  @GET('v1/vehicles/{vehicleId}/expenses/{expenseId}')
  Future<HttpResponse<ExpenseResponseModel>> getExpense(
    @Path('vehicleId') String vehicleId,
    @Path('expenseId') String expenseId,
  );

  @PATCH('v1/vehicles/{vehicleId}/expenses/{expenseId}')
  Future<HttpResponse<ExpenseResponseModel>> updateExpense(
    @Path('vehicleId') String vehicleId,
    @Path('expenseId') String expenseId,
    @Body() UpdateExpenseRequestModel request,
  );

  @DELETE('v1/vehicles/{vehicleId}/expenses/{expenseId}')
  Future<HttpResponse<DeleteExpenseResponseModel>> deleteExpense(
    @Path('vehicleId') String vehicleId,
    @Path('expenseId') String expenseId,
  );

  @POST('v1/vehicles/{vehicleId}/reminders')
  Future<HttpResponse<ReminderResponseModel>> createReminder(
    @Path('vehicleId') String vehicleId,
    @Body() CreateReminderRequestModel request,
  );

  @GET('v1/vehicles/{vehicleId}/reminders')
  Future<HttpResponse<GetRemindersResponseModel>> getReminders(
    @Path('vehicleId') String vehicleId,
  );

  @GET('v1/vehicles/{vehicleId}/reminders/{reminderId}')
  Future<HttpResponse<ReminderResponseModel>> getReminder(
    @Path('vehicleId') String vehicleId,
    @Path('reminderId') String reminderId,
  );

  @PATCH('v1/vehicles/{vehicleId}/reminders/{reminderId}')
  Future<HttpResponse<ReminderResponseModel>> updateReminder(
    @Path('vehicleId') String vehicleId,
    @Path('reminderId') String reminderId,
    @Body() UpdateReminderRequestModel request,
  );

  @PATCH('v1/vehicles/{vehicleId}/reminders/{reminderId}/complete')
  Future<HttpResponse<ReminderResponseModel>> completeReminder(
    @Path('vehicleId') String vehicleId,
    @Path('reminderId') String reminderId,
  );

  @DELETE('v1/vehicles/{vehicleId}/reminders/{reminderId}')
  Future<HttpResponse<DeleteReminderResponseModel>> deleteReminder(
    @Path('vehicleId') String vehicleId,
    @Path('reminderId') String reminderId,
  );

  @GET('v1/vehicles/{vehicleId}/statistics')
  Future<HttpResponse<GeneralStatisticsResponseModel>> getGeneralStatistics(@Path('vehicleId') String vehicleId);

  @GET('v1/vehicles/{vehicleId}/statistics/fuel')
  Future<HttpResponse<FuelStatisticsResponseModel>> getFuelStatistics(@Path('vehicleId') String vehicleId);

  @GET('v1/vehicles/{vehicleId}/statistics/maintenance')
  Future<HttpResponse<MaintenanceStatisticsResponseModel>> getMaintenanceStatistics(@Path('vehicleId') String vehicleId);

  @GET('v1/vehicles/{vehicleId}/statistics/expenses')
  Future<HttpResponse<ExpenseStatisticsResponseModel>> getExpenseStatistics(@Path('vehicleId') String vehicleId);

  @GET('v1/vehicles/{vehicleId}/statistics/total-cost')
  Future<HttpResponse<TrueVehicleCostResponseModel>> getTrueVehicleCost(@Path('vehicleId') String vehicleId);

  @POST('v1/devices')
  Future<HttpResponse<DeviceResponseModel>> registerDevice(
    @Body() RegisterDeviceRequestModel request,
  );

  @PATCH('v1/devices/{deviceId}/fcm-token')
  Future<HttpResponse<DeviceResponseModel>> updateFcmToken(
    @Path('deviceId') String deviceId,
    @Body() UpdateFcmTokenRequestModel request,
  );

  @DELETE('v1/devices/{deviceId}')
  Future<HttpResponse<DeleteDeviceResponseModel>> deleteDevice(
    @Path('deviceId') String deviceId,
  );
}
