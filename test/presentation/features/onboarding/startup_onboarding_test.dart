import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/service/local/onboarding/onboarding_storage.dart';
import 'package:sayarti_mobile/presentation/features/splash/cubit/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<SplashCubit> createCubit({required bool completed}) async {
    SharedPreferences.setMockInitialValues({
      if (completed) 'onboarding_completed': true,
    });
    final preferences = await SharedPreferences.getInstance();
    final cubit = SplashCubit(
      OnboardingStorage(Future.value(preferences)),
    );
    await cubit.stream.firstWhere((state) => state.showOnboarding != null);
    return cubit;
  }

  test('first-time startup requests onboarding', () async {
    final cubit = await createCubit(completed: false);
    expect(cubit.state.showOnboarding, isTrue);
    await cubit.close();
  });

  test('completed startup does not request onboarding again', () async {
    final cubit = await createCubit(completed: true);
    expect(cubit.state.showOnboarding, isFalse);
    await cubit.close();
  });
}
