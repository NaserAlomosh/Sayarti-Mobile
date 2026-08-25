import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/service/local/onboarding/onboarding_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  getIt.registerLazySingleton<OnboardingStorage>(
    () => OnboardingStorage(getIt.getAsync<SharedPreferences>()),
  );
}
