import 'package:flutter/material.dart';

extension FormKeyExtension on GlobalKey<FormState>? {
  /// Validates all form fields.
  ///
  /// Returns `true` when all fields are valid.
  bool get isValid => this?.currentState?.validate() ?? false;

  /// Saves all form fields.
  void save() {
    this?.currentState?.save();
  }

  /// Resets all form fields to their initial values.
  void reset() {
    this?.currentState?.reset();
  }

  /// Validates the form and saves it when valid.
  ///
  /// Returns `true` when validation succeeds.
  bool validateAndSave() {
    final formState = this?.currentState;

    if (formState == null || !formState.validate()) {
      return false;
    }

    formState.save();
    return true;
  }

  /// Returns `true` when the form is currently mounted.
  bool get isMounted => this?.currentState != null;
}