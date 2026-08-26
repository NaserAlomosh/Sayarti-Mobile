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
import 'package:sayarti_mobile/data/repository/local/language/language_repository_impl.dart'
    as _i466;
import 'package:sayarti_mobile/data/repository/remote/auth/auth_repository_impl.dart'
    as _i307;
import 'package:sayarti_mobile/data/repository/remote/dashboard/dashboard_repository_impl.dart'
    as _i520;
import 'package:sayarti_mobile/data/repository/remote/device/device_repository_impl.dart'
    as _i51;
import 'package:sayarti_mobile/data/repository/remote/expense/expense_repository_impl.dart'
    as _i54;
import 'package:sayarti_mobile/data/repository/remote/fuel/fuel_repository_impl.dart'
    as _i507;
import 'package:sayarti_mobile/data/repository/remote/maintenance/maintenance_repository_impl.dart'
    as _i16;
import 'package:sayarti_mobile/data/repository/remote/reference/reference_repository_impl.dart'
    as _i984;
import 'package:sayarti_mobile/data/repository/remote/reminder/reminder_repository_impl.dart'
    as _i758;
import 'package:sayarti_mobile/data/repository/remote/statistics/statistics_repository_impl.dart'
    as _i71;
import 'package:sayarti_mobile/data/repository/remote/user/user_repository_impl.dart'
    as _i478;
import 'package:sayarti_mobile/data/repository/remote/vehicle/vehicle_repository_impl.dart'
    as _i182;
import 'package:sayarti_mobile/data/repository/remote/vehicle_activity/vehicle_activity_repository_impl.dart'
    as _i650;
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart'
    as _i406;
import 'package:sayarti_mobile/data/storage/auth/auth_session_storage_impl.dart'
    as _i374;
import 'package:sayarti_mobile/domain/repository/local/biometric/biometric_repository.dart'
    as _i696;
import 'package:sayarti_mobile/domain/repository/local/language/language_repository.dart'
    as _i635;
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart'
    as _i777;
import 'package:sayarti_mobile/domain/repository/remote/dashboard/dashboard_repository.dart'
    as _i1033;
import 'package:sayarti_mobile/domain/repository/remote/device/device_repository.dart'
    as _i160;
import 'package:sayarti_mobile/domain/repository/remote/expense/expense_repository.dart'
    as _i508;
import 'package:sayarti_mobile/domain/repository/remote/fuel/fuel_repository.dart'
    as _i946;
import 'package:sayarti_mobile/domain/repository/remote/maintenance/maintenance_repository.dart'
    as _i938;
import 'package:sayarti_mobile/domain/repository/remote/reference/reference_repository.dart'
    as _i758;
import 'package:sayarti_mobile/domain/repository/remote/reminder/reminder_repository.dart'
    as _i327;
import 'package:sayarti_mobile/domain/repository/remote/statistics/statistics_repository.dart'
    as _i725;
import 'package:sayarti_mobile/domain/repository/remote/user/user_repository.dart'
    as _i142;
import 'package:sayarti_mobile/domain/repository/remote/vehicle/vehicle_repository.dart'
    as _i709;
import 'package:sayarti_mobile/domain/repository/remote/vehicle_activity/vehicle_activity_repository.dart'
    as _i292;
import 'package:sayarti_mobile/domain/storage/auth/auth_session_storage.dart'
    as _i706;
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
    as _i757;
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart'
    as _i764;
import 'package:sayarti_mobile/domain/usecase/remote/auth/logout_usecase.dart'
    as _i50;
import 'package:sayarti_mobile/domain/usecase/remote/auth/refresh_session_usecase.dart'
    as _i129;
import 'package:sayarti_mobile/domain/usecase/remote/auth/register_usecase.dart'
    as _i638;
import 'package:sayarti_mobile/domain/usecase/remote/auth/resend_verification_usecase.dart'
    as _i456;
import 'package:sayarti_mobile/domain/usecase/remote/auth/verify_email_usecase.dart'
    as _i26;
import 'package:sayarti_mobile/domain/usecase/remote/dashboard/get_dashboard_usecase.dart'
    as _i563;
import 'package:sayarti_mobile/domain/usecase/remote/device/delete_device_usecase.dart'
    as _i541;
import 'package:sayarti_mobile/domain/usecase/remote/device/register_device_usecase.dart'
    as _i794;
import 'package:sayarti_mobile/domain/usecase/remote/device/update_fcm_token_usecase.dart'
    as _i715;
import 'package:sayarti_mobile/domain/usecase/remote/expense/create_expense_usecase.dart'
    as _i586;
import 'package:sayarti_mobile/domain/usecase/remote/expense/delete_expense_usecase.dart'
    as _i384;
import 'package:sayarti_mobile/domain/usecase/remote/expense/get_expense_usecase.dart'
    as _i725;
import 'package:sayarti_mobile/domain/usecase/remote/expense/get_expenses_usecase.dart'
    as _i337;
import 'package:sayarti_mobile/domain/usecase/remote/expense/update_expense_usecase.dart'
    as _i55;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/create_fuel_record_usecase.dart'
    as _i286;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/delete_fuel_record_usecase.dart'
    as _i876;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_record_usecase.dart'
    as _i36;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_records_usecase.dart'
    as _i589;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_summary_usecase.dart'
    as _i815;
import 'package:sayarti_mobile/domain/usecase/remote/fuel/update_fuel_record_usecase.dart'
    as _i506;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/create_maintenance_record_usecase.dart'
    as _i644;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/delete_maintenance_record_usecase.dart'
    as _i91;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/get_maintenance_record_usecase.dart'
    as _i405;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/get_maintenance_records_usecase.dart'
    as _i946;
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/update_maintenance_record_usecase.dart'
    as _i256;
import 'package:sayarti_mobile/domain/usecase/remote/reference/get_countries_usecase.dart'
    as _i524;
import 'package:sayarti_mobile/domain/usecase/remote/reference/get_currencies_usecase.dart'
    as _i936;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/complete_reminder_usecase.dart'
    as _i454;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/create_reminder_usecase.dart'
    as _i815;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/delete_reminder_usecase.dart'
    as _i801;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/get_reminder_usecase.dart'
    as _i210;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/get_reminders_usecase.dart'
    as _i77;
import 'package:sayarti_mobile/domain/usecase/remote/reminder/update_reminder_usecase.dart'
    as _i504;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_expense_statistics_usecase.dart'
    as _i749;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_fuel_statistics_usecase.dart'
    as _i119;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_general_statistics_usecase.dart'
    as _i637;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_maintenance_statistics_usecase.dart'
    as _i350;
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_true_vehicle_cost_usecase.dart'
    as _i517;
import 'package:sayarti_mobile/domain/usecase/remote/user/change_default_currency_usecase.dart'
    as _i867;
import 'package:sayarti_mobile/domain/usecase/remote/user/delete_account_usecase.dart'
    as _i779;
import 'package:sayarti_mobile/domain/usecase/remote/user/get_current_user_usecase.dart'
    as _i478;
import 'package:sayarti_mobile/domain/usecase/remote/user/select_country_usecase.dart'
    as _i168;
import 'package:sayarti_mobile/domain/usecase/remote/user/update_user_usecase.dart'
    as _i8;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/create_vehicle_usecase.dart'
    as _i562;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/delete_vehicle_usecase.dart'
    as _i451;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/get_vehicle_details_usecase.dart'
    as _i311;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/get_vehicles_usecase.dart'
    as _i392;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/update_vehicle_mileage_usecase.dart'
    as _i726;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/update_vehicle_usecase.dart'
    as _i689;
import 'package:sayarti_mobile/domain/usecase/remote/vehicle_activity/get_vehicle_activity_usecase.dart'
    as _i370;
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
    gh.lazySingleton<_i152.LocalAuthentication>(
      () => localAuthModule.localAuthentication,
    );
    gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => localAuthModule.sharedPreferences,
    );
    gh.lazySingleton<_i817.ThemeCubit>(() => _i817.ThemeCubit());
    gh.lazySingleton<_i635.LanguageRepository>(
      () => _i466.LanguageRepositoryImpl(),
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
    gh.lazySingleton<_i706.AuthSessionStorage>(
      () => _i374.AuthSessionStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i757.GetUserLanguageUsecase>(
      () => _i757.GetUserLanguageUsecase(gh<_i635.LanguageRepository>()),
    );
    gh.lazySingleton<_i724.SaveUserLanguageUsecase>(
      () => _i724.SaveUserLanguageUsecase(gh<_i635.LanguageRepository>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => remoteMoudel.dio(gh<_i706.AuthSessionStorage>()),
    );
    gh.lazySingleton<_i480.LanguageCubit>(
      () => _i480.LanguageCubit(
        gh<_i757.GetUserLanguageUsecase>(),
        gh<_i724.SaveUserLanguageUsecase>(),
      ),
    );
    gh.lazySingleton<_i406.ApiService>(
      () => remoteMoudel.apiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1033.DashboardRepository>(
      () => _i520.DashboardRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i938.MaintenanceRepository>(
      () => _i16.MaintenanceRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i160.DeviceRepository>(
      () => _i51.DeviceRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i541.DeleteDeviceUseCase>(
      () => _i541.DeleteDeviceUseCase(gh<_i160.DeviceRepository>()),
    );
    gh.lazySingleton<_i794.RegisterDeviceUseCase>(
      () => _i794.RegisterDeviceUseCase(gh<_i160.DeviceRepository>()),
    );
    gh.lazySingleton<_i715.UpdateFcmTokenUseCase>(
      () => _i715.UpdateFcmTokenUseCase(gh<_i160.DeviceRepository>()),
    );
    gh.lazySingleton<_i644.CreateMaintenanceRecordUseCase>(
      () => _i644.CreateMaintenanceRecordUseCase(
        gh<_i938.MaintenanceRepository>(),
      ),
    );
    gh.lazySingleton<_i91.DeleteMaintenanceRecordUseCase>(
      () => _i91.DeleteMaintenanceRecordUseCase(
        gh<_i938.MaintenanceRepository>(),
      ),
    );
    gh.lazySingleton<_i405.GetMaintenanceRecordUseCase>(
      () =>
          _i405.GetMaintenanceRecordUseCase(gh<_i938.MaintenanceRepository>()),
    );
    gh.lazySingleton<_i946.GetMaintenanceRecordsUseCase>(
      () =>
          _i946.GetMaintenanceRecordsUseCase(gh<_i938.MaintenanceRepository>()),
    );
    gh.lazySingleton<_i256.UpdateMaintenanceRecordUseCase>(
      () => _i256.UpdateMaintenanceRecordUseCase(
        gh<_i938.MaintenanceRepository>(),
      ),
    );
    gh.lazySingleton<_i563.GetDashboardUseCase>(
      () => _i563.GetDashboardUseCase(gh<_i1033.DashboardRepository>()),
    );
    gh.lazySingleton<_i292.VehicleActivityRepository>(
      () => _i650.VehicleActivityRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i725.StatisticsRepository>(
      () => _i71.StatisticsRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i370.GetVehicleActivityUseCase>(
      () => _i370.GetVehicleActivityUseCase(
        gh<_i292.VehicleActivityRepository>(),
      ),
    );
    gh.lazySingleton<_i508.ExpenseRepository>(
      () => _i54.ExpenseRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i709.VehicleRepository>(
      () => _i182.VehicleRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i749.GetExpenseStatisticsUseCase>(
      () => _i749.GetExpenseStatisticsUseCase(gh<_i725.StatisticsRepository>()),
    );
    gh.lazySingleton<_i119.GetFuelStatisticsUseCase>(
      () => _i119.GetFuelStatisticsUseCase(gh<_i725.StatisticsRepository>()),
    );
    gh.lazySingleton<_i637.GetGeneralStatisticsUseCase>(
      () => _i637.GetGeneralStatisticsUseCase(gh<_i725.StatisticsRepository>()),
    );
    gh.lazySingleton<_i350.GetMaintenanceStatisticsUseCase>(
      () => _i350.GetMaintenanceStatisticsUseCase(
        gh<_i725.StatisticsRepository>(),
      ),
    );
    gh.lazySingleton<_i517.GetTrueVehicleCostUseCase>(
      () => _i517.GetTrueVehicleCostUseCase(gh<_i725.StatisticsRepository>()),
    );
    gh.lazySingleton<_i142.UserRepository>(
      () => _i478.UserRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i327.ReminderRepository>(
      () => _i758.ReminderRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i758.ReferenceRepository>(
      () => _i984.ReferenceRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i777.AuthRepository>(
      () => _i307.AuthRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i946.FuelRepository>(
      () => _i507.FuelRepositoryImpl(gh<_i406.ApiService>()),
    );
    gh.lazySingleton<_i524.GetCountriesUseCase>(
      () => _i524.GetCountriesUseCase(gh<_i758.ReferenceRepository>()),
    );
    gh.lazySingleton<_i936.GetCurrenciesUseCase>(
      () => _i936.GetCurrenciesUseCase(gh<_i758.ReferenceRepository>()),
    );
    gh.lazySingleton<_i867.ChangeDefaultCurrencyUseCase>(
      () => _i867.ChangeDefaultCurrencyUseCase(gh<_i142.UserRepository>()),
    );
    gh.lazySingleton<_i779.DeleteAccountUseCase>(
      () => _i779.DeleteAccountUseCase(gh<_i142.UserRepository>()),
    );
    gh.lazySingleton<_i478.GetCurrentUserUseCase>(
      () => _i478.GetCurrentUserUseCase(gh<_i142.UserRepository>()),
    );
    gh.lazySingleton<_i168.SelectCountryUseCase>(
      () => _i168.SelectCountryUseCase(gh<_i142.UserRepository>()),
    );
    gh.lazySingleton<_i8.UpdateUserUseCase>(
      () => _i8.UpdateUserUseCase(gh<_i142.UserRepository>()),
    );
    gh.lazySingleton<_i562.CreateVehicleUseCase>(
      () => _i562.CreateVehicleUseCase(gh<_i709.VehicleRepository>()),
    );
    gh.lazySingleton<_i451.DeleteVehicleUseCase>(
      () => _i451.DeleteVehicleUseCase(gh<_i709.VehicleRepository>()),
    );
    gh.lazySingleton<_i311.GetVehicleDetailsUseCase>(
      () => _i311.GetVehicleDetailsUseCase(gh<_i709.VehicleRepository>()),
    );
    gh.lazySingleton<_i392.GetVehiclesUseCase>(
      () => _i392.GetVehiclesUseCase(gh<_i709.VehicleRepository>()),
    );
    gh.lazySingleton<_i726.UpdateVehicleMileageUseCase>(
      () => _i726.UpdateVehicleMileageUseCase(gh<_i709.VehicleRepository>()),
    );
    gh.lazySingleton<_i689.UpdateVehicleUseCase>(
      () => _i689.UpdateVehicleUseCase(gh<_i709.VehicleRepository>()),
    );
    gh.lazySingleton<_i757.GoogleLoginUseCase>(
      () => _i757.GoogleLoginUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i764.LoginUseCase>(
      () => _i764.LoginUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i50.LogoutUseCase>(
      () => _i50.LogoutUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i129.RefreshSessionUseCase>(
      () => _i129.RefreshSessionUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i638.RegisterUseCase>(
      () => _i638.RegisterUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i456.ResendVerificationUseCase>(
      () => _i456.ResendVerificationUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i26.VerifyEmailUseCase>(
      () => _i26.VerifyEmailUseCase(gh<_i777.AuthRepository>()),
    );
    gh.lazySingleton<_i454.CompleteReminderUseCase>(
      () => _i454.CompleteReminderUseCase(gh<_i327.ReminderRepository>()),
    );
    gh.lazySingleton<_i815.CreateReminderUseCase>(
      () => _i815.CreateReminderUseCase(gh<_i327.ReminderRepository>()),
    );
    gh.lazySingleton<_i801.DeleteReminderUseCase>(
      () => _i801.DeleteReminderUseCase(gh<_i327.ReminderRepository>()),
    );
    gh.lazySingleton<_i210.GetReminderUseCase>(
      () => _i210.GetReminderUseCase(gh<_i327.ReminderRepository>()),
    );
    gh.lazySingleton<_i77.GetRemindersUseCase>(
      () => _i77.GetRemindersUseCase(gh<_i327.ReminderRepository>()),
    );
    gh.lazySingleton<_i504.UpdateReminderUseCase>(
      () => _i504.UpdateReminderUseCase(gh<_i327.ReminderRepository>()),
    );
    gh.lazySingleton<_i586.CreateExpenseUseCase>(
      () => _i586.CreateExpenseUseCase(gh<_i508.ExpenseRepository>()),
    );
    gh.lazySingleton<_i384.DeleteExpenseUseCase>(
      () => _i384.DeleteExpenseUseCase(gh<_i508.ExpenseRepository>()),
    );
    gh.lazySingleton<_i725.GetExpenseUseCase>(
      () => _i725.GetExpenseUseCase(gh<_i508.ExpenseRepository>()),
    );
    gh.lazySingleton<_i337.GetExpensesUseCase>(
      () => _i337.GetExpensesUseCase(gh<_i508.ExpenseRepository>()),
    );
    gh.lazySingleton<_i55.UpdateExpenseUseCase>(
      () => _i55.UpdateExpenseUseCase(gh<_i508.ExpenseRepository>()),
    );
    gh.lazySingleton<_i286.CreateFuelRecordUseCase>(
      () => _i286.CreateFuelRecordUseCase(gh<_i946.FuelRepository>()),
    );
    gh.lazySingleton<_i876.DeleteFuelRecordUseCase>(
      () => _i876.DeleteFuelRecordUseCase(gh<_i946.FuelRepository>()),
    );
    gh.lazySingleton<_i36.GetFuelRecordUseCase>(
      () => _i36.GetFuelRecordUseCase(gh<_i946.FuelRepository>()),
    );
    gh.lazySingleton<_i589.GetFuelRecordsUseCase>(
      () => _i589.GetFuelRecordsUseCase(gh<_i946.FuelRepository>()),
    );
    gh.lazySingleton<_i815.GetFuelSummaryUseCase>(
      () => _i815.GetFuelSummaryUseCase(gh<_i946.FuelRepository>()),
    );
    gh.lazySingleton<_i506.UpdateFuelRecordUseCase>(
      () => _i506.UpdateFuelRecordUseCase(gh<_i946.FuelRepository>()),
    );
    return this;
  }
}

class _$LocalAuthModule extends _i685.LocalAuthModule {}

class _$RemoteMoudel extends _i84.RemoteMoudel {}
