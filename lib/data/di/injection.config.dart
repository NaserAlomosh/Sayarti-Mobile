// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_auth/local_auth.dart' as _i152;
import 'package:sayarti_mobile/data/di/local_moudel.dart' as _i685;
import 'package:sayarti_mobile/data/di/remote_moudel.dart' as _i84;
import 'package:sayarti_mobile/data/networking/dio/dio_client.dart' as _i313;
import 'package:sayarti_mobile/data/repository/local/language/language_repository_impl.dart'
    as _i466;
import 'package:sayarti_mobile/data/storage/auth/auth_session_storage_impl.dart'
    as _i1000;
import 'package:sayarti_mobile/data/repository/remote/auth/auth_repository_impl.dart'
    as _i307;
import 'package:sayarti_mobile/data/repository/remote/reference/reference_repository_impl.dart'
    as _i900;
import 'package:sayarti_mobile/data/repository/remote/user/user_repository_impl.dart'
    as _i910;
import 'package:sayarti_mobile/data/repository/remote/vehicle/vehicle_repository_impl.dart'
    as _i920;
import 'package:sayarti_mobile/data/repository/remote/vehicle_activity/vehicle_activity_repository_impl.dart'
    as _i973;
import 'package:sayarti_mobile/domain/repository/remote/vehicle_activity/vehicle_activity_repository.dart'
    as _i974;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle_activity/get_vehicle_activity_usecase.dart'
    as _i975;
import 'package:sayarti_mobile/data/repository/remote/fuel/fuel_repository_impl.dart' as _i928;
import 'package:sayarti_mobile/domain/repository/remote/fuel/fuel_repository.dart' as _i929;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/create_fuel_record_usecase.dart' as _i930;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/delete_fuel_record_usecase.dart' as _i931;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_record_usecase.dart' as _i932;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_records_usecase.dart' as _i933;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_summary_usecase.dart' as _i934;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/update_fuel_record_usecase.dart' as _i935;
import 'package:sayarti_mobile/data/repository/remote/maintenance/maintenance_repository_impl.dart' as _i936;
import 'package:sayarti_mobile/domain/repository/remote/maintenance/maintenance_repository.dart' as _i937;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/create_maintenance_record_usecase.dart' as _i938;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/delete_maintenance_record_usecase.dart' as _i939;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/get_maintenance_record_usecase.dart' as _i940;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/get_maintenance_records_usecase.dart' as _i941;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/update_maintenance_record_usecase.dart' as _i942;
import 'package:sayarti_mobile/data/repository/remote/expense/expense_repository_impl.dart' as _i943;
import 'package:sayarti_mobile/domain/repository/remote/expense/expense_repository.dart' as _i944;
import 'package:sayarti_mobile/domain/usecase/remote/expense/create_expense_usecase.dart' as _i945;
import 'package:sayarti_mobile/domain/usecase/remote/expense/delete_expense_usecase.dart' as _i946;
import 'package:sayarti_mobile/domain/usecase/remote/expense/get_expense_usecase.dart' as _i947;
import 'package:sayarti_mobile/domain/usecase/remote/expense/get_expenses_usecase.dart' as _i948;
import 'package:sayarti_mobile/domain/usecase/remote/expense/update_expense_usecase.dart' as _i949;
import 'package:sayarti_mobile/data/repository/remote/reminder/reminder_repository_impl.dart' as _i950;
import 'package:sayarti_mobile/data/repository/remote/device/device_repository_impl.dart' as _i958;
import 'package:sayarti_mobile/data/repository/remote/statistics/statistics_repository_impl.dart' as _i963;
import 'package:sayarti_mobile/data/repository/remote/dashboard/dashboard_repository_impl.dart' as _i970;
import 'package:sayarti_mobile/domain/repository/remote/dashboard/dashboard_repository.dart' as _i971;
import 'package:sayarti_mobile/domain/usecase/remote/dashboard/get_dashboard_usecase.dart' as _i972;
import 'package:sayarti_mobile/domain/repository/remote/statistics/statistics_repository.dart' as _i964;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_general_statistics_usecase.dart' as _i965;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_fuel_statistics_usecase.dart' as _i966;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_maintenance_statistics_usecase.dart' as _i967;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_expense_statistics_usecase.dart' as _i968;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_true_vehicle_cost_usecase.dart' as _i969;
import 'package:sayarti_mobile/domain/repository/remote/device/device_repository.dart' as _i959;
import 'package:sayarti_mobile/domain/usecase/remote/device/delete_device_usecase.dart' as _i960;
import 'package:sayarti_mobile/domain/usecase/remote/device/register_device_usecase.dart' as _i961;
import 'package:sayarti_mobile/domain/usecase/remote/device/update_fcm_token_usecase.dart' as _i962;
import 'package:sayarti_mobile/domain/repository/remote/reminder/reminder_repository.dart' as _i951;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/complete_reminder_usecase.dart' as _i952;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/create_reminder_usecase.dart' as _i953;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/delete_reminder_usecase.dart' as _i954;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/get_reminder_usecase.dart' as _i955;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/get_reminders_usecase.dart' as _i956;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/update_reminder_usecase.dart' as _i957;
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart'
    as _i406;
import 'package:sayarti_mobile/domain/repository/local/biometric/biometric_repository.dart'
    as _i696;
import 'package:sayarti_mobile/domain/repository/local/language/language_repository.dart'
    as _i635;
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart'
    as _i777;
import 'package:sayarti_mobile/domain/repository/remote/reference/reference_repository.dart'
    as _i901;
import 'package:sayarti_mobile/domain/repository/remote/user/user_repository.dart'
    as _i911;
import 'package:sayarti_mobile/domain/repository/remote/vehicle/vehicle_repository.dart'
    as _i921;
import 'package:sayarti_mobile/domain/storage/auth/auth_session_storage.dart'
    as _i1001;
import 'package:sayarti_mobile/domain/usecase/local/biometric/authenticate_biometric_usecase.dart'
    as _i615;
import 'package:sayarti_mobile/domain/usecase/local/biometric/get_biometric_info_usecase.dart'
    as _i32;
import 'package:sayarti_mobile/domain/usecase/local/biometric/stop_biometric_authentication_usecase.dart'
    as _i33;
import 'package:sayarti_mobile/domain/usecase/local/language/get_user_language_usecase.dart'
    as _i757;
import 'package:sayarti_mobile/domain/usecase/local/language/save_user_language_usecase.dart'
    as _i724;
import 'package:sayarti_mobile/domain/usecase/remote/auth/google_login_usecase.dart'
    as _i905;
import 'package:sayarti_mobile/domain/usecase/remote/auth/logout_usecase.dart'
    as _i906;
import 'package:sayarti_mobile/domain/usecase/remote/auth/refresh_session_usecase.dart'
    as _i907;
import 'package:sayarti_mobile/domain/usecase/remote/auth/resend_verification_usecase.dart'
    as _i908;
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart'
    as _i764;
import 'package:sayarti_mobile/domain/usecase/remote/auth/register_usecase.dart'
    as _i902;
import 'package:sayarti_mobile/domain/usecase/remote/auth/verify_email_usecase.dart'
    as _i903;
import 'package:sayarti_mobile/domain/usecase/remote/reference/get_countries_usecase.dart'
    as _i904;
import 'package:sayarti_mobile/domain/usecase/remote/reference/get_currencies_usecase.dart'
    as _i909;
import 'package:sayarti_mobile/domain/usecase/remote/user/change_default_currency_usecase.dart'
    as _i912;
import 'package:sayarti_mobile/domain/usecase/remote/user/delete_account_usecase.dart'
    as _i913;
import 'package:sayarti_mobile/domain/usecase/remote/user/get_current_user_usecase.dart'
    as _i914;
import 'package:sayarti_mobile/domain/usecase/remote/user/select_country_usecase.dart'
    as _i915;
import 'package:sayarti_mobile/domain/usecase/remote/user/update_user_usecase.dart'
    as _i916;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/create_vehicle_usecase.dart' as _i922;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/delete_vehicle_usecase.dart' as _i923;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/get_vehicle_details_usecase.dart' as _i924;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/get_vehicles_usecase.dart' as _i925;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/update_vehicle_mileage_usecase.dart' as _i926;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/update_vehicle_usecase.dart' as _i927;
import 'package:sayarti_mobile/presentation/core/theme/cubit/theme_cubit.dart'
    as _i817;
import 'package:sayarti_mobile/presentation/core/widgets/language/cubit/languge_cubit.dart'
    as _i480;
import 'package:sayarti_mobile/presentation/features/onboarding/cubit/onboarding_cubit.dart'
    as _i664;
import 'package:sayarti_mobile/presentation/features/splash/cubit/splash_cubit.dart'
    as _i50;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final localAuthModule = _$LocalAuthModule();
    final remoteMoudel = _$RemoteMoudel();
    gh.factory<_i664.OnboardingCubit>(() => _i664.OnboardingCubit());
    gh.factory<_i50.SplashCubit>(() => _i50.SplashCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => localAuthModule.secureStorage,
    );
    gh.lazySingleton<_i1001.AuthSessionStorage>(
      () => _i1000.AuthSessionStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i152.LocalAuthentication>(
      () => localAuthModule.localAuthentication,
    );
    gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => localAuthModule.sharedPreferences,
    );
    gh.lazySingleton<_i361.Dio>(() => remoteMoudel.dio());
    gh.lazySingleton<_i817.ThemeCubit>(() => _i817.ThemeCubit());
    gh.lazySingleton<_i313.DioClient>(
      () => _i313.DioClient(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i635.LanguageRepository>(
      () => _i466.LanguageRepositoryImpl(),
    );
    gh.lazySingleton<_i406.ApiService>(
      () => remoteMoudel.apiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i615.AuthenticateBiometricUsecase>(
      () => _i615.AuthenticateBiometricUsecase(gh<_i696.BiometricRepository>()),
    );
    gh.lazySingleton<_i32.GetBiometricInfoUsecase>(
      () => _i32.GetBiometricInfoUsecase(gh<_i696.BiometricRepository>()),
    );
    gh.lazySingleton<_i33.StopBiometricAuthenticationUsecase>(
      () => _i33.StopBiometricAuthenticationUsecase(
        gh<_i696.BiometricRepository>(),
      ),
    );
    gh.lazySingleton<_i757.GetUserLanguageUsecase>(
      () => _i757.GetUserLanguageUsecase(gh<_i635.LanguageRepository>()),
    );
    gh.lazySingleton<_i724.SaveUserLanguageUsecase>(
      () => _i724.SaveUserLanguageUsecase(gh<_i635.LanguageRepository>()),
    );
    gh.lazySingleton<_i777.AuthRepository>(
      () => _i307.AuthRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i764.LoginUseCase>(
      () => _i764.LoginUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i905.GoogleLoginUseCase>(
      () => _i905.GoogleLoginUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i906.LogoutUseCase>(
      () => _i906.LogoutUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i907.RefreshSessionUseCase>(
      () => _i907.RefreshSessionUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i908.ResendVerificationUseCase>(
      () => _i908.ResendVerificationUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i901.ReferenceRepository>(
      () => _i900.ReferenceRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i911.UserRepository>(
      () => _i910.UserRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i921.VehicleRepository>(
      () => _i920.VehicleRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i974.VehicleActivityRepository>(
      () => _i973.VehicleActivityRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i975.GetVehicleActivityUseCase>(
      () => _i975.GetVehicleActivityUseCase(
        gh<_i974.VehicleActivityRepository>(),
      ),
    );
    gh.lazySingleton<_i929.FuelRepository>(
      () => _i928.FuelRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i937.MaintenanceRepository>(
      () => _i936.MaintenanceRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i944.ExpenseRepository>(
      () => _i943.ExpenseRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i951.ReminderRepository>(
      () => _i950.ReminderRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i959.DeviceRepository>(
      () => _i958.DeviceRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i964.StatisticsRepository>(
      () => _i963.StatisticsRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i965.GetGeneralStatisticsUseCase>(() => _i965.GetGeneralStatisticsUseCase(gh<_i964.StatisticsRepository>()));
    gh.lazySingleton<_i966.GetFuelStatisticsUseCase>(() => _i966.GetFuelStatisticsUseCase(gh<_i964.StatisticsRepository>()));
    gh.lazySingleton<_i967.GetMaintenanceStatisticsUseCase>(() => _i967.GetMaintenanceStatisticsUseCase(gh<_i964.StatisticsRepository>()));
    gh.lazySingleton<_i968.GetExpenseStatisticsUseCase>(() => _i968.GetExpenseStatisticsUseCase(gh<_i964.StatisticsRepository>()));
    gh.lazySingleton<_i969.GetTrueVehicleCostUseCase>(() => _i969.GetTrueVehicleCostUseCase(gh<_i964.StatisticsRepository>()));
    gh.lazySingleton<_i971.DashboardRepository>(() => _i970.DashboardRepositoryImpl(gh<_i406.ApiService>()));
    gh.lazySingleton<_i972.GetDashboardUseCase>(() => _i972.GetDashboardUseCase(gh<_i971.DashboardRepository>()));
    gh.lazySingleton<_i902.RegisterUseCase>(
      () => _i902.RegisterUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i903.VerifyEmailUseCase>(
      () => _i903.VerifyEmailUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i904.GetCountriesUseCase>(
      () => _i904.GetCountriesUseCase(gh<_i901.ReferenceRepository>()),
    );
    gh.lazySingleton<_i909.GetCurrenciesUseCase>(
      () => _i909.GetCurrenciesUseCase(gh<_i901.ReferenceRepository>()),
    );
    gh.lazySingleton<_i912.ChangeDefaultCurrencyUseCase>(
      () => _i912.ChangeDefaultCurrencyUseCase(gh<_i911.UserRepository>()),
    );
    gh.lazySingleton<_i913.DeleteAccountUseCase>(
      () => _i913.DeleteAccountUseCase(gh<_i911.UserRepository>()),
    );
    gh.lazySingleton<_i914.GetCurrentUserUseCase>(
      () => _i914.GetCurrentUserUseCase(gh<_i911.UserRepository>()),
    );
    gh.lazySingleton<_i915.SelectCountryUseCase>(
      () => _i915.SelectCountryUseCase(gh<_i911.UserRepository>()),
    );
    gh.lazySingleton<_i916.UpdateUserUseCase>(
      () => _i916.UpdateUserUseCase(gh<_i911.UserRepository>()),
    );
    gh.lazySingleton<_i930.CreateFuelRecordUseCase>(() => _i930.CreateFuelRecordUseCase(gh<_i929.FuelRepository>()));
    gh.lazySingleton<_i931.DeleteFuelRecordUseCase>(() => _i931.DeleteFuelRecordUseCase(gh<_i929.FuelRepository>()));
    gh.lazySingleton<_i932.GetFuelRecordUseCase>(() => _i932.GetFuelRecordUseCase(gh<_i929.FuelRepository>()));
    gh.lazySingleton<_i933.GetFuelRecordsUseCase>(() => _i933.GetFuelRecordsUseCase(gh<_i929.FuelRepository>()));
    gh.lazySingleton<_i934.GetFuelSummaryUseCase>(() => _i934.GetFuelSummaryUseCase(gh<_i929.FuelRepository>()));
    gh.lazySingleton<_i935.UpdateFuelRecordUseCase>(() => _i935.UpdateFuelRecordUseCase(gh<_i929.FuelRepository>()));
    gh.lazySingleton<_i938.CreateMaintenanceRecordUseCase>(() => _i938.CreateMaintenanceRecordUseCase(gh<_i937.MaintenanceRepository>()));
    gh.lazySingleton<_i939.DeleteMaintenanceRecordUseCase>(() => _i939.DeleteMaintenanceRecordUseCase(gh<_i937.MaintenanceRepository>()));
    gh.lazySingleton<_i940.GetMaintenanceRecordUseCase>(() => _i940.GetMaintenanceRecordUseCase(gh<_i937.MaintenanceRepository>()));
    gh.lazySingleton<_i941.GetMaintenanceRecordsUseCase>(() => _i941.GetMaintenanceRecordsUseCase(gh<_i937.MaintenanceRepository>()));
    gh.lazySingleton<_i942.UpdateMaintenanceRecordUseCase>(() => _i942.UpdateMaintenanceRecordUseCase(gh<_i937.MaintenanceRepository>()));
    gh.lazySingleton<_i945.CreateExpenseUseCase>(() => _i945.CreateExpenseUseCase(gh<_i944.ExpenseRepository>()));
    gh.lazySingleton<_i946.DeleteExpenseUseCase>(() => _i946.DeleteExpenseUseCase(gh<_i944.ExpenseRepository>()));
    gh.lazySingleton<_i947.GetExpenseUseCase>(() => _i947.GetExpenseUseCase(gh<_i944.ExpenseRepository>()));
    gh.lazySingleton<_i948.GetExpensesUseCase>(() => _i948.GetExpensesUseCase(gh<_i944.ExpenseRepository>()));
    gh.lazySingleton<_i949.UpdateExpenseUseCase>(() => _i949.UpdateExpenseUseCase(gh<_i944.ExpenseRepository>()));
    gh.lazySingleton<_i952.CompleteReminderUseCase>(() => _i952.CompleteReminderUseCase(gh<_i951.ReminderRepository>()));
    gh.lazySingleton<_i953.CreateReminderUseCase>(() => _i953.CreateReminderUseCase(gh<_i951.ReminderRepository>()));
    gh.lazySingleton<_i954.DeleteReminderUseCase>(() => _i954.DeleteReminderUseCase(gh<_i951.ReminderRepository>()));
    gh.lazySingleton<_i955.GetReminderUseCase>(() => _i955.GetReminderUseCase(gh<_i951.ReminderRepository>()));
    gh.lazySingleton<_i956.GetRemindersUseCase>(() => _i956.GetRemindersUseCase(gh<_i951.ReminderRepository>()));
    gh.lazySingleton<_i957.UpdateReminderUseCase>(() => _i957.UpdateReminderUseCase(gh<_i951.ReminderRepository>()));
    gh.lazySingleton<_i960.DeleteDeviceUseCase>(() => _i960.DeleteDeviceUseCase(gh<_i959.DeviceRepository>()));
    gh.lazySingleton<_i961.RegisterDeviceUseCase>(() => _i961.RegisterDeviceUseCase(gh<_i959.DeviceRepository>()));
    gh.lazySingleton<_i962.UpdateFcmTokenUseCase>(() => _i962.UpdateFcmTokenUseCase(gh<_i959.DeviceRepository>()));
    gh.lazySingleton<_i922.CreateVehicleUseCase>(() => _i922.CreateVehicleUseCase(gh<_i921.VehicleRepository>()));
    gh.lazySingleton<_i923.DeleteVehicleUseCase>(() => _i923.DeleteVehicleUseCase(gh<_i921.VehicleRepository>()));
    gh.lazySingleton<_i924.GetVehicleDetailsUseCase>(() => _i924.GetVehicleDetailsUseCase(gh<_i921.VehicleRepository>()));
    gh.lazySingleton<_i925.GetVehiclesUseCase>(() => _i925.GetVehiclesUseCase(gh<_i921.VehicleRepository>()));
    gh.lazySingleton<_i926.UpdateVehicleMileageUseCase>(() => _i926.UpdateVehicleMileageUseCase(gh<_i921.VehicleRepository>()));
    gh.lazySingleton<_i927.UpdateVehicleUseCase>(() => _i927.UpdateVehicleUseCase(gh<_i921.VehicleRepository>()));
    gh.lazySingleton<_i480.LanguageCubit>(
      () => _i480.LanguageCubit(
        gh<_i757.GetUserLanguageUsecase>(),
        gh<_i724.SaveUserLanguageUsecase>(),
      ),
    );
    return this;
  }
}

class _$LocalAuthModule extends _i685.LocalAuthModule {}

class _$RemoteMoudel extends _i84.RemoteMoudel {}
