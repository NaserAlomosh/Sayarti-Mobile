import 'package:flutter/services.dart';

class AppInputFormatter {
  static FilteringTextInputFormatter onlyLetters() {
    return FilteringTextInputFormatter.allow(
      RegExp('[a-zA-Z]'),
    );
  }

  static FilteringTextInputFormatter onlyLettersWithSpace() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'[a-zA-Z ]'),
    );
  }

  static FilteringTextInputFormatter onlyEnglishLanguage() {
    return FilteringTextInputFormatter.allow(
      RegExp('^[\u0000-\u007F]+\$'),
    );
  }

  static FilteringTextInputFormatter onlyLettersAndSpaces() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'[a-zA-Z]+|\s'),
    );
  }

  static FilteringTextInputFormatter onlyNumbers() {
    return FilteringTextInputFormatter.allow(
      RegExp('[0-9]'),
    );
  }

  static FilteringTextInputFormatter onlyNumbersWithDecimal() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'^\d+(\.\d*)?'),
    );
  }

  static FilteringTextInputFormatter onlyNumbersAndLetters() {
    return FilteringTextInputFormatter.allow(
      RegExp('[a-zA-Z0-9]'),
    );
  }

  static FilteringTextInputFormatter onlyNumbersAndLettersWithSpace() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'[a-zA-Z0-9 ]'),
    );
  }

  static FilteringTextInputFormatter onlyLettersWithSpaceAndHyphen() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'[a-zA-Z -]'),
    );
  }
  static FilteringTextInputFormatter onlyLetterArabicAndEnglishWithSpaces() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'[a-zA-Z\u0600-\u06FF\s]'),
    );
  }
}
