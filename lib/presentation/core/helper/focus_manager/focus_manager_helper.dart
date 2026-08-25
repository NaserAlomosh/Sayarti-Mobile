import 'package:flutter/material.dart';

class FocusManagerHelper {
  FocusManagerHelper._();

  static FocusNode? get primaryFocus =>
      FocusManager.instance.primaryFocus;

  static bool get hasFocus => primaryFocus != null;

  static void unfocus() {
    primaryFocus?.unfocus();
  }

  static void request(FocusNode focusNode) {
    focusNode.requestFocus();
  }

  static void next(BuildContext context) {
    FocusScope.of(context).nextFocus();
  }

  static void previous(BuildContext context) {
    FocusScope.of(context).previousFocus();
  }

  static void clear(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}