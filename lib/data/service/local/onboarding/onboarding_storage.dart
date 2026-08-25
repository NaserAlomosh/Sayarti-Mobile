import 'package:shared_preferences/shared_preferences.dart';

/// Persists the single piece of durable state owned by the onboarding flow.
class OnboardingStorage {
  OnboardingStorage(this._preferences);

  static const _completedKey = 'onboarding_completed';

  final Future<SharedPreferences> _preferences;

  Future<bool> isCompleted() async {
    final preferences = await _preferences;
    return preferences.getBool(_completedKey) ?? false;
  }

  Future<void> complete() async {
    final preferences = await _preferences;
    await preferences.setBool(_completedKey, true);
  }
}
