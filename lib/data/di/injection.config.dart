// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_auth/local_auth.dart' as _i152;
import 'package:sayarti_mobile/data/di/local_moudel.dart' as _i685;
import 'package:sayarti_mobile/data/di/remote_moudel.dart' as _i84;
import 'package:sayarti_mobile/data/networking/dio/dio_client.dart' as _i313;
import 'package:sayarti_mobile/data/repository/local/biometric/biometric_repository_impl.dart'
    as _i630;
import 'package:sayarti_mobile/data/repository/local/language/language_repository_impl.dart'
    as _i466;
import 'package:sayarti_mobile/data/service/local/biometric/biometric_service.dart'
    as _i868;
import 'package:sayarti_mobile/data/service/local/biometric/impl/biometric_service_impl.dart'
    as _i417;
import 'package:sayarti_mobile/data/service/local/onboarding/onboarding_storage.dart'
    as _i114;
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart'
    as _i406;
import 'package:sayarti_mobile/domain/repository/local/biometric/biometric_repository.dart'
    as _i696;
import 'package:sayarti_mobile/domain/repository/local/language/language_repository.dart'
    as _i635;
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
    gh.factory<_i50.SplashCubit>(
      () => _i50.SplashCubit(gh<_i114.OnboardingStorage>()),
    );
    gh.lazySingleton<_i868.BiometricService>(
      () => _i417.BiometricServiceImpl(gh<_i152.LocalAuthentication>()),
    );
    gh.lazySingleton<_i757.GetUserLanguageUsecase>(
      () => _i757.GetUserLanguageUsecase(gh<_i635.LanguageRepository>()),
    );
    gh.lazySingleton<_i724.SaveUserLanguageUsecase>(
      () => _i724.SaveUserLanguageUsecase(gh<_i635.LanguageRepository>()),
    );
    gh.lazySingleton<_i696.BiometricRepository>(
      () => _i630.BiometricRepositoryImpl(gh<_i868.BiometricService>()),
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
