import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/service/local/onboarding/onboarding_storage.dart';
import 'package:sayarti_mobile/data/service/local/session/session_storage.dart';
import 'package:sayarti_mobile/data/repository/remote/auth/auth_repository_impl.dart';
import 'package:sayarti_mobile/domain/repository/remote/auth/auth_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/login_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/register_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/resend_verification_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/auth/verify_email_usecase.dart';
import 'package:sayarti_mobile/presentation/features/login/cubit/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  if (!getIt.isRegistered<FlutterSecureStorage>()) {
    getIt.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );
  }
  getIt.registerLazySingleton<SessionStorage>(() => SessionStorage(getIt()));
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton<VerifyEmailUseCase>(
    () => VerifyEmailUseCase(getIt()),
  );
  getIt.registerLazySingleton<ResendVerificationUseCase>(
    () => ResendVerificationUseCase(getIt()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<OnboardingStorage>(
    () => OnboardingStorage(getIt.getAsync<SharedPreferences>()),
  );
}
