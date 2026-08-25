import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/service/local/onboarding/onboarding_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('is incomplete initially and remains complete after persistence', () async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final storage = OnboardingStorage(Future.value(preferences));

    expect(await storage.isCompleted(), isFalse);
    await storage.complete();
    expect(await storage.isCompleted(), isTrue);

    final recreatedStorage = OnboardingStorage(
      Future.value(await SharedPreferences.getInstance()),
    );
    expect(await recreatedStorage.isCompleted(), isTrue);
  });
}
