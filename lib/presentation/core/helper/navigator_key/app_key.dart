import 'package:flutter/material.dart';

class AppKey {
  AppKey._();

  static final navigator = GlobalKey<NavigatorState>();
  static final scaffoldMessenger = GlobalKey<ScaffoldMessengerState>();

  static NavigatorState? get navigatorState => navigator.currentState;

  static BuildContext get navigatorContext => navigator.currentContext!;

  static ScaffoldMessengerState? get scaffoldMessengerState =>
      scaffoldMessenger.currentState;

  static BuildContext? get scaffoldMessengerContext =>
      scaffoldMessenger.currentContext;
}