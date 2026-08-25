import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class LocalAuthModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  LocalAuthentication get localAuthentication => LocalAuthentication();

  @lazySingleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
