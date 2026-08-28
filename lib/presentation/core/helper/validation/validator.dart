import 'package:flutter/material.dart';
import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/helper/extension/string_extension.dart';

class Validator {
  static String? email(BuildContext context, String? email) {
    if (email.isNullOrEmpty) {
      return S.of(context).cannotBeEmpty;
    } else if (!email.isValidEmail) {
      return S.of(context).emailInvalid;
    }
    return null;
  }

  static String? password(BuildContext context, String? value) {
    if (value.isNullOrEmpty) {
      return S.of(context).passwordCannotBeEmpty;
    } else if ((value?.length ?? 0) < 8) {
      return S.of(context).passwordShouldBeGreaterThan8Characters;
    }
    return null;
  }
}
