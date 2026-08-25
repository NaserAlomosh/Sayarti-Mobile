// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Banking-on-the-Go`
  String get intro2Title {
    return Intl.message(
      'Banking-on-the-Go',
      name: 'intro2Title',
      desc: '',
      args: [],
    );
  }

  /// `Get an instant approval for credit\ncard and personal loan application`
  String get intro2Subtitle {
    return Intl.message(
      'Get an instant approval for credit\ncard and personal loan application',
      name: 'intro2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Please Enter`
  String get pleaseEnter {
    return Intl.message(
      'Please Enter',
      name: 'pleaseEnter',
      desc: '',
      args: [],
    );
  }

  /// `Account Registration`
  String get accountRegistration {
    return Intl.message(
      'Account Registration',
      name: 'accountRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the following details to get you registered.`
  String get accountRegistration1 {
    return Intl.message(
      'Please complete the following details to get you registered.',
      name: 'accountRegistration1',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mobile number`
  String get mobileNumberHint {
    return Intl.message(
      'Enter your mobile number',
      name: 'mobileNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `7X XXX XXXX`
  String get mobileHintMessage {
    return Intl.message(
      '7X XXX XXXX',
      name: 'mobileHintMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email (Optional)`
  String get emailOptional {
    return Intl.message(
      'Email (Optional)',
      name: 'emailOptional',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Enter your username`
  String get usernameHint {
    return Intl.message(
      'Enter your username',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Username must be a minimum of 7 alphanumeric characters`
  String get usernameMustBeAMinimumOf7Alphanumeric {
    return Intl.message(
      'Username must be a minimum of 7 alphanumeric characters',
      name: 'usernameMustBeAMinimumOf7Alphanumeric',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Minimum of 8 characters with combination of at least 1 uppercase, 1 lowercase, 1 symbol and 1 digit`
  String get passwordInstructions {
    return Intl.message(
      'Minimum of 8 characters with combination of at least 1 uppercase, 1 lowercase, 1 symbol and 1 digit',
      name: 'passwordInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter Password`
  String get reEnterYourPassword {
    return Intl.message(
      'Re-Enter Password',
      name: 'reEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter your password`
  String get reEnterYourPasswordHint {
    return Intl.message(
      'Re-Enter your password',
      name: 'reEnterYourPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Account Opening Availability`
  String get accountOpeningAvailablity {
    return Intl.message(
      'Account Opening Availability',
      name: 'accountOpeningAvailablity',
      desc: '',
      args: [],
    );
  }

  /// `Account opening is only available for Jordanians for now, but don’t worry we’re expanding into new nationalities, soon!`
  String
  get accountOpeningIsOnlyAvailableForJordaniansForNowButDonTWorryWeReExpandingIntoNewNationalitiesSoon {
    return Intl.message(
      'Account opening is only available for Jordanians for now, but don’t worry we’re expanding into new nationalities, soon!',
      name: 'accountOpeningIsOnlyAvailableForJordaniansForNowButDonTWorryWeReExpandingIntoNewNationalitiesSoon',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Please enter email address`
  String get pleaseEnterEmailAddress {
    return Intl.message(
      'Please enter email address',
      name: 'pleaseEnterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Email not valid`
  String get emailNotValid {
    return Intl.message(
      'Email not valid',
      name: 'emailNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 255 characters allowed`
  String get maximum255CharactersAllowed {
    return Intl.message(
      'Maximum 255 characters allowed',
      name: 'maximum255CharactersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get usernameCannotBeEmpty {
    return Intl.message(
      'Username cannot be empty',
      name: 'usernameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Username must be of minimum 7 characters`
  String get usernameMustBeOfMinimum7Characters {
    return Intl.message(
      'Username must be of minimum 7 characters',
      name: 'usernameMustBeOfMinimum7Characters',
      desc: '',
      args: [],
    );
  }

  /// `Username must be of maximum 20 characters`
  String get usernameMustBeOfMaximum20Characters {
    return Intl.message(
      'Username must be of maximum 20 characters',
      name: 'usernameMustBeOfMaximum20Characters',
      desc: '',
      args: [],
    );
  }

  /// `No spaces allowed`
  String get noSpacesAllowed {
    return Intl.message(
      'No spaces allowed',
      name: 'noSpacesAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number cannot be empty`
  String get mobileNumberCannotBeEmpty {
    return Intl.message(
      'Mobile number cannot be empty',
      name: 'mobileNumberCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid Mobile number`
  String get enterAValidMobileNumber {
    return Intl.message(
      'Enter a valid Mobile number',
      name: 'enterAValidMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number should be of {count} digits`
  String mobileNumberShouldBeOfNDigits(Object count) {
    return Intl.message(
      'Mobile number should be of $count digits',
      name: 'mobileNumberShouldBeOfNDigits',
      desc: '',
      args: [count],
    );
  }

  /// `Mobile number must be between {minMobileLength} and {maxMobileLength} digits`
  String mobileNumberMustbeInRange(
    Object minMobileLength,
    Object maxMobileLength,
  ) {
    return Intl.message(
      'Mobile number must be between $minMobileLength and $maxMobileLength digits',
      name: 'mobileNumberMustbeInRange',
      desc: '',
      args: [minMobileLength, maxMobileLength],
    );
  }

  /// `Mobile number should begin with 7`
  String get mobileNumberShouldBeginWith7 {
    return Intl.message(
      'Mobile number should begin with 7',
      name: 'mobileNumberShouldBeginWith7',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number should be of 9 digits`
  String get mobileNumberShouldBeOf9Digits {
    return Intl.message(
      'Mobile number should be of 9 digits',
      name: 'mobileNumberShouldBeOf9Digits',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get passwordCannotBeEmpty {
    return Intl.message(
      'Password cannot be empty',
      name: 'passwordCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must have atleast 1 lowercase`
  String get passwordMustHaveAtleast1Lowercase {
    return Intl.message(
      'Password must have atleast 1 lowercase',
      name: 'passwordMustHaveAtleast1Lowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must have atleast 1 uppercase`
  String get passwordMustHaveAtleast1Uppercase {
    return Intl.message(
      'Password must have atleast 1 uppercase',
      name: 'passwordMustHaveAtleast1Uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must have atleast 1 number`
  String get passwordMustHaveAtLeast1number {
    return Intl.message(
      'Password must have atleast 1 number',
      name: 'passwordMustHaveAtLeast1number',
      desc: '',
      args: [],
    );
  }

  /// `Password must have atleast 1 symbol`
  String get passwordMustHaveAtLeast1Symbol {
    return Intl.message(
      'Password must have atleast 1 symbol',
      name: 'passwordMustHaveAtLeast1Symbol',
      desc: '',
      args: [],
    );
  }

  /// `Password should be greater than 8 characters`
  String get passwordShouldBeGreaterThan8Characters {
    return Intl.message(
      'Password should be greater than 8 characters',
      name: 'passwordShouldBeGreaterThan8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please select a country`
  String get pleaseSelectACountry {
    return Intl.message(
      'Please select a country',
      name: 'pleaseSelectACountry',
      desc: '',
      args: [],
    );
  }

  /// `Please select a city`
  String get pleaseSelectACity {
    return Intl.message(
      'Please select a city',
      name: 'pleaseSelectACity',
      desc: '',
      args: [],
    );
  }

  /// `Please Select a State First`
  String get pleaseSelectAStateFirst {
    return Intl.message(
      'Please Select a State First',
      name: 'pleaseSelectAStateFirst',
      desc: '',
      args: [],
    );
  }

  /// `Please select a subdivision first`
  String get pleaseSelectSubdivision {
    return Intl.message(
      'Please select a subdivision first',
      name: 'pleaseSelectSubdivision',
      desc: '',
      args: [],
    );
  }

  /// `Area cannot be empty`
  String get areaCannotBeEmpty {
    return Intl.message(
      'Area cannot be empty',
      name: 'areaCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 35 characters. English letters and numbers only.`
  String get districtMax35 {
    return Intl.message(
      'Maximum 35 characters. English letters and numbers only.',
      name: 'districtMax35',
      desc: '',
      args: [],
    );
  }

  /// `Street name cannot be empty`
  String get streetNameCannotBeEmpty {
    return Intl.message(
      'Street name cannot be empty',
      name: 'streetNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 22 characters.`
  String get streetMax22 {
    return Intl.message(
      'Maximum 22 characters.',
      name: 'streetMax22',
      desc: '',
      args: [],
    );
  }

  /// `English letters and numbers only allowed.`
  String get onlyEnglishAndNumberAllowed {
    return Intl.message(
      'English letters and numbers only allowed.',
      name: 'onlyEnglishAndNumberAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Only English character and number Allowed`
  String get onlyEnglishCharacterAndNumberAllowed {
    return Intl.message(
      'Only English character and number Allowed',
      name: 'onlyEnglishCharacterAndNumberAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Maximum of 35 characters only`
  String get maximum35CharactersOnly {
    return Intl.message(
      'Maximum of 35 characters only',
      name: 'maximum35CharactersOnly',
      desc: '',
      args: [],
    );
  }

  /// `Building name cannot be empty`
  String get buildingNameCannotBeEmpty {
    return Intl.message(
      'Building name cannot be empty',
      name: 'buildingNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Only English characters are allowed`
  String get onlyEnglishCharacterAllowed {
    return Intl.message(
      'Only English characters are allowed',
      name: 'onlyEnglishCharacterAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Building number cannot be empty`
  String get buildingNoCannotBeEmpty {
    return Intl.message(
      'Building number cannot be empty',
      name: 'buildingNoCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 10 digits allowed`
  String get maximum10DigitsAllowed {
    return Intl.message(
      'Maximum 10 digits allowed',
      name: 'maximum10DigitsAllowed',
      desc: '',
      args: [],
    );
  }

  /// `PO Box cannot be empty`
  String get poBoxCannotBeEmpty {
    return Intl.message(
      'PO Box cannot be empty',
      name: 'poBoxCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid input. Only numeric values are allowed in the P.O. Box field`
  String get poBoxShouldBeNumeric {
    return Intl.message(
      'Invalid input. Only numeric values are allowed in the P.O. Box field',
      name: 'poBoxShouldBeNumeric',
      desc: '',
      args: [],
    );
  }

  /// `Must be numeric only. Maximum 10 digits.`
  String get poBoxNumericMax10 {
    return Intl.message(
      'Must be numeric only. Maximum 10 digits.',
      name: 'poBoxNumericMax10',
      desc: '',
      args: [],
    );
  }

  /// `Zip code cannot be empty`
  String get zipCodeCannotBeEmpty {
    return Intl.message(
      'Zip code cannot be empty',
      name: 'zipCodeCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please select an occupation`
  String get pleaseSelectAnOccupation {
    return Intl.message(
      'Please select an occupation',
      name: 'pleaseSelectAnOccupation',
      desc: '',
      args: [],
    );
  }

  /// `Annual Income cannot be empty`
  String get annualIncomeCannotBeEmpty {
    return Intl.message(
      'Annual Income cannot be empty',
      name: 'annualIncomeCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Employer Name cannot be empty`
  String get employerNameCannotBeEmpty {
    return Intl.message(
      'Employer Name cannot be empty',
      name: 'employerNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 35 characters. English letters and numbers only.`
  String get employerNameMax35 {
    return Intl.message(
      'Maximum 35 characters. English letters and numbers only.',
      name: 'employerNameMax35',
      desc: '',
      args: [],
    );
  }

  /// `Employer Building Name cannot be empty`
  String get employerBuildingNameCannotBeEmpty {
    return Intl.message(
      'Employer Building Name cannot be empty',
      name: 'employerBuildingNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Employer Street cannot be empty`
  String get employerStreetCannotBeEmpty {
    return Intl.message(
      'Employer Street cannot be empty',
      name: 'employerStreetCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Employer Area cannot be empty`
  String get employerAreaCannotBeEmpty {
    return Intl.message(
      'Employer Area cannot be empty',
      name: 'employerAreaCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Employer Phone Number cannot be empty`
  String get employerPhoneNumberCannotBeEmpty {
    return Intl.message(
      'Employer Phone Number cannot be empty',
      name: 'employerPhoneNumberCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Employment Status cannot be empty`
  String get employmentStatusCannotBeEmpty {
    return Intl.message(
      'Employment Status cannot be empty',
      name: 'employmentStatusCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please select an Additional Income`
  String get pleaseSelectAnAdditionalIncome {
    return Intl.message(
      'Please select an Additional Income',
      name: 'pleaseSelectAnAdditionalIncome',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be empty`
  String get nameCannotBeEmpty {
    return Intl.message(
      'Name cannot be empty',
      name: 'nameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Type of Disability`
  String get pleaseEnterYourTypeOfDisability {
    return Intl.message(
      'Please enter your Type of Disability',
      name: 'pleaseEnterYourTypeOfDisability',
      desc: '',
      args: [],
    );
  }

  /// `Spouse Name cannot be empty`
  String get spouseNameCannotBeEmpty {
    return Intl.message(
      'Spouse Name cannot be empty',
      name: 'spouseNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Spouse Name cannot be longer than 35 characters`
  String get spouseNameTooLong {
    return Intl.message(
      'Spouse Name cannot be longer than 35 characters',
      name: 'spouseNameTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Number of Children cannot be empty`
  String get numberOfChildrenCannotBeEmpty {
    return Intl.message(
      'Number of Children cannot be empty',
      name: 'numberOfChildrenCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name of Children's cannot be empty`
  String get nameOfChildrensCannotBeEmpty {
    return Intl.message(
      'Name of Children\'s cannot be empty',
      name: 'nameOfChildrensCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Nature of Special Needs cannot be empty`
  String get natureOfSpecialNeedCantBeEmpty {
    return Intl.message(
      'Nature of Special Needs cannot be empty',
      name: 'natureOfSpecialNeedCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name of P.E.P cannot be empty`
  String get nameOfPEPCannotBeEmpty {
    return Intl.message(
      'Name of P.E.P cannot be empty',
      name: 'nameOfPEPCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Role of P.E.P cannot be empty`
  String get roleOfPEPCannotBeEmpty {
    return Intl.message(
      'Role of P.E.P cannot be empty',
      name: 'roleOfPEPCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Purpose of Account Opening cannot be empty`
  String get purposeOfAccountOpeningCannotBeEmpty {
    return Intl.message(
      'Purpose of Account Opening cannot be empty',
      name: 'purposeOfAccountOpeningCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Expected Monthly Transactions cannot be empty`
  String get expectedMonthlyTransactionsCannotBeEmpty {
    return Intl.message(
      'Expected Monthly Transactions cannot be empty',
      name: 'expectedMonthlyTransactionsCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please provide a List of Account Number`
  String get pleaseProvideaListofAccountNumber {
    return Intl.message(
      'Please provide a List of Account Number',
      name: 'pleaseProvideaListofAccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a U.S Line 1 Address`
  String get pleaseEnteraUSLine1Address {
    return Intl.message(
      'Please enter a U.S Line 1 Address',
      name: 'pleaseEnteraUSLine1Address',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a U.S Line 2 Address`
  String get pleaseEnteraUSLine2Address {
    return Intl.message(
      'Please enter a U.S Line 2 Address',
      name: 'pleaseEnteraUSLine2Address',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a U.S Telephone Number`
  String get pleaseEnterAUSTelephoneNumber {
    return Intl.message(
      'Please enter a U.S Telephone Number',
      name: 'pleaseEnterAUSTelephoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name as per Income Tax Return`
  String get pleaseEnterYourNameAsPerIncomeTaxReturn {
    return Intl.message(
      'Please enter your name as per Income Tax Return',
      name: 'pleaseEnterYourNameAsPerIncomeTaxReturn',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Tax Identification Number`
  String get pleaseEnterYourTaxIdentificationNumber {
    return Intl.message(
      'Please enter your Tax Identification Number',
      name: 'pleaseEnterYourTaxIdentificationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Requester Name cannot be empty`
  String get requesterNameCannotBeEmpty {
    return Intl.message(
      'Requester Name cannot be empty',
      name: 'requesterNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a Requester Line 1 Address`
  String get pleaseEnteraRequesterLine1Address {
    return Intl.message(
      'Please enter a Requester Line 1 Address',
      name: 'pleaseEnteraRequesterLine1Address',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a Requester Line 2 Address`
  String get pleaseEnteraRequesterLine2Address {
    return Intl.message(
      'Please enter a Requester Line 2 Address',
      name: 'pleaseEnteraRequesterLine2Address',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Social Security Identification Number`
  String get pleaseEnterYourSocialSecurityIdentificationNumber {
    return Intl.message(
      'Please enter your Social Security Identification Number',
      name: 'pleaseEnterYourSocialSecurityIdentificationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Employer Identification Number`
  String get pleaseEnterYourEmployerIdentificationNumber {
    return Intl.message(
      'Please enter your Employer Identification Number',
      name: 'pleaseEnterYourEmployerIdentificationNumber',
      desc: '',
      args: [],
    );
  }

  /// `MANY CHARACTER`
  String get manyCharacters {
    return Intl.message(
      'MANY CHARACTER',
      name: 'manyCharacters',
      desc: '',
      args: [],
    );
  }

  /// `No countries found`
  String get noCountriesFound {
    return Intl.message(
      'No countries found',
      name: 'noCountriesFound',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Verify Your Email`
  String get verifyYourEmail {
    return Intl.message(
      'Verify Your Email',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code sent to your email`
  String get pleaseEnterTheVerificationCodeSentToEmail {
    return Intl.message(
      'Please enter the verification code sent to your email',
      name: 'pleaseEnterTheVerificationCodeSentToEmail',
      desc: '',
      args: [],
    );
  }

  /// `6-Digit Code`
  String get sixDigitsCode {
    return Intl.message(
      '6-Digit Code',
      name: 'sixDigitsCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `in`
  String get iN {
    return Intl.message('in', name: 'iN', desc: '', args: []);
  }

  /// `Please select a Product Type`
  String get pleaseSelectAProductType {
    return Intl.message(
      'Please select a Product Type',
      name: 'pleaseSelectAProductType',
      desc: '',
      args: [],
    );
  }

  /// `Please select a Purpose of Account Opening`
  String get pleaseSelectaPurposeOfAccountOpening {
    return Intl.message(
      'Please select a Purpose of Account Opening',
      name: 'pleaseSelectaPurposeOfAccountOpening',
      desc: '',
      args: [],
    );
  }

  /// `Nickname cannot be empty`
  String get nicknameCannotBeEmpty {
    return Intl.message(
      'Nickname cannot be empty',
      name: 'nicknameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `no special character allowed`
  String get noSpecialCharacterAllowed {
    return Intl.message(
      'no special character allowed',
      name: 'noSpecialCharacterAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Account nick name should not be greater than 100 characters`
  String get accountNickNameShouldNotBeGreaterThanCharacters {
    return Intl.message(
      'Account nick name should not be greater than 100 characters',
      name: 'accountNickNameShouldNotBeGreaterThanCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Account No. cannot be empty`
  String get accountNoCannotBeEmpty {
    return Intl.message(
      'Account No. cannot be empty',
      name: 'accountNoCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter numerical characters only, up to five digits.`
  String get pleaseEnterUptoFiveDigits {
    return Intl.message(
      'Please enter numerical characters only, up to five digits.',
      name: 'pleaseEnterUptoFiveDigits',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Income cannot be empty`
  String get monthlyIncomeCannotBeEmpty {
    return Intl.message(
      'Monthly Income cannot be empty',
      name: 'monthlyIncomeCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Debit card number cannot be empty`
  String get debitCardNoCanNotBeEmpty {
    return Intl.message(
      'Debit card number cannot be empty',
      name: 'debitCardNoCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Debit card number should be of 16 digits`
  String get debitCardNumberOf16Digits {
    return Intl.message(
      'Debit card number should be of 16 digits',
      name: 'debitCardNumberOf16Digits',
      desc: '',
      args: [],
    );
  }

  /// `Credit card number should be of 16 digits`
  String get creditCardNumberOf16Digits {
    return Intl.message(
      'Credit card number should be of 16 digits',
      name: 'creditCardNumberOf16Digits',
      desc: '',
      args: [],
    );
  }

  /// `Debit card pin cannot be empty`
  String get debitCardPinCanNotBeEmpty {
    return Intl.message(
      'Debit card pin cannot be empty',
      name: 'debitCardPinCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Debit card pin should be of 4 digits`
  String get debitCardPineOf4Digits {
    return Intl.message(
      'Debit card pin should be of 4 digits',
      name: 'debitCardPineOf4Digits',
      desc: '',
      args: [],
    );
  }

  /// `Credit card PIN cannot be empty`
  String get creditCardPinCanNotBeEmpty {
    return Intl.message(
      'Credit card PIN cannot be empty',
      name: 'creditCardPinCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Credit card pin should be of 4 digits`
  String get creditCardPineOf4Digits {
    return Intl.message(
      'Credit card pin should be of 4 digits',
      name: 'creditCardPineOf4Digits',
      desc: '',
      args: [],
    );
  }

  /// `Card can't be empty`
  String get debitCardCannotBeEmpty {
    return Intl.message(
      'Card can\'t be empty',
      name: 'debitCardCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Card Should be of 16 Digits`
  String get debitCardLenghtmustbe16 {
    return Intl.message(
      'Card Should be of 16 Digits',
      name: 'debitCardLenghtmustbe16',
      desc: '',
      args: [],
    );
  }

  /// `PIN can't be empty`
  String get cardPinCannotBeEmpty {
    return Intl.message(
      'PIN can\'t be empty',
      name: 'cardPinCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `PIN Should be of 4 Digits`
  String get cardpinLenghtmustbe4 {
    return Intl.message(
      'PIN Should be of 4 Digits',
      name: 'cardpinLenghtmustbe4',
      desc: '',
      args: [],
    );
  }

  /// `National ID / Passport No can not be empty`
  String get nationIdOrPassportNoCanNotBeEmpty {
    return Intl.message(
      'National ID / Passport No can not be empty',
      name: 'nationIdOrPassportNoCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `National ID OR Passport No. Should Not Be More Than 10 Characters`
  String get nationalIdOrPassportNoShouldNotBeMoreThan10Characters {
    return Intl.message(
      'National ID OR Passport No. Should Not Be More Than 10 Characters',
      name: 'nationalIdOrPassportNoShouldNotBeMoreThan10Characters',
      desc: '',
      args: [],
    );
  }

  /// `National ID OR Passport No. Can Only Contain Alphanumerics`
  String get nationalIdOrPassportNoCanOnlyContainAlphanumerics {
    return Intl.message(
      'National ID OR Passport No. Can Only Contain Alphanumerics',
      name: 'nationalIdOrPassportNoCanOnlyContainAlphanumerics',
      desc: '',
      args: [],
    );
  }

  /// `Customer ID can not be empty`
  String get customerIdCanNotBeEmpty {
    return Intl.message(
      'Customer ID can not be empty',
      name: 'customerIdCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter 7 digit Customer ID`
  String get pleaseEnter7DigitCustomerId {
    return Intl.message(
      'Please enter 7 digit Customer ID',
      name: 'pleaseEnter7DigitCustomerId',
      desc: '',
      args: [],
    );
  }

  /// `Account Can Only Contain Numbers`
  String get accountCanOnlyContainNumbers {
    return Intl.message(
      'Account Can Only Contain Numbers',
      name: 'accountCanOnlyContainNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Alias cannot be empty`
  String get aliasCannotBeEmpty {
    return Intl.message(
      'Alias cannot be empty',
      name: 'aliasCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Alias must have atleast 1 Uppercase`
  String get aliasMustHaveAtleast1Uppercase {
    return Intl.message(
      'Alias must have atleast 1 Uppercase',
      name: 'aliasMustHaveAtleast1Uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Alias Should Be Less Than 10 Characters`
  String get aliasShouldBeLessThan10Characters {
    return Intl.message(
      'Alias Should Be Less Than 10 Characters',
      name: 'aliasShouldBeLessThan10Characters',
      desc: '',
      args: [],
    );
  }

  /// `Alias Should Be Greater Than 3 Characters`
  String get aliasShouldBeGreatThan3Characters {
    return Intl.message(
      'Alias Should Be Greater Than 3 Characters',
      name: 'aliasShouldBeGreatThan3Characters',
      desc: '',
      args: [],
    );
  }

  /// `Nick name cannot be empty`
  String get nicKNameEmpty {
    return Intl.message(
      'Nick name cannot be empty',
      name: 'nicKNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Nickname must be a maximum of 50 characters.`
  String get epNicknameValidation {
    return Intl.message(
      'Nickname must be a maximum of 50 characters.',
      name: 'epNicknameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Only English letters, numbers, and spaces are allowed`
  String get onlyEnglishLettersNumbersAndSpacesAreAllowed {
    return Intl.message(
      'Only English letters, numbers, and spaces are allowed',
      name: 'onlyEnglishLettersNumbersAndSpacesAreAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Password can only contain english letters, special characters and numbers`
  String get passwordValidationText {
    return Intl.message(
      'Password can only contain english letters, special characters and numbers',
      name: 'passwordValidationText',
      desc: '',
      args: [],
    );
  }

  /// `Password should not contain space`
  String get passwordSpace {
    return Intl.message(
      'Password should not contain space',
      name: 'passwordSpace',
      desc: '',
      args: [],
    );
  }

  /// `Password Doesn't Match`
  String get passwordDoesNotMatch {
    return Intl.message(
      'Password Doesn\'t Match',
      name: 'passwordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `PIN cannot be empty`
  String get pinCannotBeEmpty {
    return Intl.message(
      'PIN cannot be empty',
      name: 'pinCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `PIN should be of 6 digits`
  String get pinShouldBeOf6Characters {
    return Intl.message(
      'PIN should be of 6 digits',
      name: 'pinShouldBeOf6Characters',
      desc: '',
      args: [],
    );
  }

  /// `PIN is not matched`
  String get pinIsNotMatched {
    return Intl.message(
      'PIN is not matched',
      name: 'pinIsNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Please select a business type`
  String get pleaseSelectABusinessType {
    return Intl.message(
      'Please select a business type',
      name: 'pleaseSelectABusinessType',
      desc: '',
      args: [],
    );
  }

  /// `Business annual income cannot be empty`
  String get businessAnnualIncomeCannotBeEmpty {
    return Intl.message(
      'Business annual income cannot be empty',
      name: 'businessAnnualIncomeCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Business name cannot be empty`
  String get businessNameCannotBeEmpty {
    return Intl.message(
      'Business name cannot be empty',
      name: 'businessNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Marital status cannot be empty`
  String get maritalStatusCannotBeEmpty {
    return Intl.message(
      'Marital status cannot be empty',
      name: 'maritalStatusCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Unemployment status cannot be empty`
  String get unemploymentStatusCannotBeEmpty {
    return Intl.message(
      'Unemployment status cannot be empty',
      name: 'unemploymentStatusCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Relationship with PEP cannot be empty`
  String get relationshipWithPEPCannotBeEmpty {
    return Intl.message(
      'Relationship with PEP cannot be empty',
      name: 'relationshipWithPEPCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number should be of 10 digits`
  String get mobileNumberShouldBeOf10Digits {
    return Intl.message(
      'Mobile number should be of 10 digits',
      name: 'mobileNumberShouldBeOf10Digits',
      desc: '',
      args: [],
    );
  }

  /// `Postcode cannot be empty`
  String get postcodeCannotBeEmpty {
    return Intl.message(
      'Postcode cannot be empty',
      name: 'postcodeCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Date of Birth`
  String get pleaseEnterYourDateOfBirth {
    return Intl.message(
      'Please enter your Date of Birth',
      name: 'pleaseEnterYourDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your permanent residence address for line 1`
  String get pleaseEnterYourPermanentResidenceAddressForLine1 {
    return Intl.message(
      'Please enter your permanent residence address for line 1',
      name: 'pleaseEnterYourPermanentResidenceAddressForLine1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your permanent residence address for line 2`
  String get pleaseEnterYourPermanentResidenceAddressForLine2 {
    return Intl.message(
      'Please enter your permanent residence address for line 2',
      name: 'pleaseEnterYourPermanentResidenceAddressForLine2',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your mailing address`
  String get pleaseEnterYourMailingAddress {
    return Intl.message(
      'Please enter your mailing address',
      name: 'pleaseEnterYourMailingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your US taxpayer identification number`
  String get pleaseEnterYourUSTaxpayerIdentificationNumber {
    return Intl.message(
      'Please enter your US taxpayer identification number',
      name: 'pleaseEnterYourUSTaxpayerIdentificationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your foreign taxpayer identification number`
  String get pleaseEnterYourForeignTaxpayerIdentificationNumber {
    return Intl.message(
      'Please enter your foreign taxpayer identification number',
      name: 'pleaseEnterYourForeignTaxpayerIdentificationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Treaty identified to claim cannot be empty`
  String get treatyIdentifiedToClaimCannotBeEmpty {
    return Intl.message(
      'Treaty identified to claim cannot be empty',
      name: 'treatyIdentifiedToClaimCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your type of income`
  String get pleaseEnterYourTypeOfIncome {
    return Intl.message(
      'Please enter your type of income',
      name: 'pleaseEnterYourTypeOfIncome',
      desc: '',
      args: [],
    );
  }

  /// `Explanation cannot be empty`
  String get explanationCannotBeEmpty {
    return Intl.message(
      'Explanation cannot be empty',
      name: 'explanationCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter 4 Digit`
  String get pleaseEnter4Digit {
    return Intl.message(
      'Please Enter 4 Digit',
      name: 'pleaseEnter4Digit',
      desc: '',
      args: [],
    );
  }

  /// `Field cannot be empty`
  String get fieldCannotBeEmpty {
    return Intl.message(
      'Field cannot be empty',
      name: 'fieldCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Iban Can Only Contain Alphanumerics`
  String get ibanCanOnlyContainAlphanumerics {
    return Intl.message(
      'Iban Can Only Contain Alphanumerics',
      name: 'ibanCanOnlyContainAlphanumerics',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid iban`
  String get pleaseEnterValidIban {
    return Intl.message(
      'Please enter valid iban',
      name: 'pleaseEnterValidIban',
      desc: '',
      args: [],
    );
  }

  /// `Max length of field should remain 34 alphanumeric characters`
  String get fieldMaxLengthAlphanumeric34 {
    return Intl.message(
      'Max length of field should remain 34 alphanumeric characters',
      name: 'fieldMaxLengthAlphanumeric34',
      desc: '',
      args: [],
    );
  }

  /// `Nick name should not be greater than 30 characters`
  String get nickNameShouldNotBeGreaterThanCharacters {
    return Intl.message(
      'Nick name should not be greater than 30 characters',
      name: 'nickNameShouldNotBeGreaterThanCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Nick name can only contain alphanumerics`
  String get nickNameCanOnlyContainAlphanumerics {
    return Intl.message(
      'Nick name can only contain alphanumerics',
      name: 'nickNameCanOnlyContainAlphanumerics',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be empty`
  String get nameEmpty {
    return Intl.message(
      'Name cannot be empty',
      name: 'nameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be empty`
  String get nameCanNotBeEmpty {
    return Intl.message(
      'Name cannot be empty',
      name: 'nameCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter at least 3 names with a minimum of 3\ncharacters in the first and last name`
  String get minRecipientNameValidatorError {
    return Intl.message(
      'Please enter at least 3 names with a minimum of 3\ncharacters in the first and last name',
      name: 'minRecipientNameValidatorError',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 65 characters allowed`
  String get maxLength65 {
    return Intl.message(
      'Maximum 65 characters allowed',
      name: 'maxLength65',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary name should not be greater than 70 characters`
  String get beneficiaryNameShouldNotBeGreaterThanCharacters {
    return Intl.message(
      'Beneficiary name should not be greater than 70 characters',
      name: 'beneficiaryNameShouldNotBeGreaterThanCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Numbers are not allowed in beneficiary name`
  String get numberAreNotAllowedInBeneficiaryName {
    return Intl.message(
      'Numbers are not allowed in beneficiary name',
      name: 'numberAreNotAllowedInBeneficiaryName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter first name and last name`
  String get pleaseEnterFirstNameAndLastName {
    return Intl.message(
      'Please Enter first name and last name',
      name: 'pleaseEnterFirstNameAndLastName',
      desc: '',
      args: [],
    );
  }

  /// `Bank Country cannot be empty`
  String get bankCountryCannotBeEmpty {
    return Intl.message(
      'Bank Country cannot be empty',
      name: 'bankCountryCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a swift code that meets the criteria`
  String get pleaseEnterSwiftCodeThatMeetsTheCriteria {
    return Intl.message(
      'Please enter a swift code that meets the criteria',
      name: 'pleaseEnterSwiftCodeThatMeetsTheCriteria',
      desc: '',
      args: [],
    );
  }

  /// `Swift Code cannot be empty`
  String get swiftCodeCannotBeEmpty {
    return Intl.message(
      'Swift Code cannot be empty',
      name: 'swiftCodeCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Recipient name cannot be empty`
  String get recipientNameCanNotBeEmpty {
    return Intl.message(
      'Recipient name cannot be empty',
      name: 'recipientNameCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Recipient address cannot be empty`
  String get recipientAddressCannotBeEmpty {
    return Intl.message(
      'Recipient address cannot be empty',
      name: 'recipientAddressCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary address should not be greater than 35 characters`
  String get beneficiaryAddressShouldNotBeGreaterThanCharacters {
    return Intl.message(
      'Beneficiary address should not be greater than 35 characters',
      name: 'beneficiaryAddressShouldNotBeGreaterThanCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 30 characters allowed`
  String get maxLength30 {
    return Intl.message(
      'Maximum 30 characters allowed',
      name: 'maxLength30',
      desc: '',
      args: [],
    );
  }

  /// `Bank Address can not be empty`
  String get bankAddressCanNotBeEmpty {
    return Intl.message(
      'Bank Address can not be empty',
      name: 'bankAddressCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Bank name can not be empty`
  String get bankNameCanNotBeEmpty {
    return Intl.message(
      'Bank name can not be empty',
      name: 'bankNameCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Bank town can not be empty`
  String get bankTownCanNotBeEmpty {
    return Intl.message(
      'Bank town can not be empty',
      name: 'bankTownCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Description can not be empty`
  String get descriptionCanNotBeEmpty {
    return Intl.message(
      'Description can not be empty',
      name: 'descriptionCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Description should not be greater than 35 characters`
  String get descriptionShouldNotBeGreaterThanCharacters {
    return Intl.message(
      'Description should not be greater than 35 characters',
      name: 'descriptionShouldNotBeGreaterThanCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Should not be greater than 100 characters`
  String get paymentDetailsShouldNotBeGreaterThanCharacters {
    return Intl.message(
      'Should not be greater than 100 characters',
      name: 'paymentDetailsShouldNotBeGreaterThanCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Date`
  String get pleaseSelectDate {
    return Intl.message(
      'Please Select Date',
      name: 'pleaseSelectDate',
      desc: '',
      args: [],
    );
  }

  /// `Routing number can not be empty`
  String get routingNumberCanNotBeEmpty {
    return Intl.message(
      'Routing number can not be empty',
      name: 'routingNumberCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Routing number should be of 9 numerical digits`
  String get routingNumberShouldBeOf9NumericalDigits {
    return Intl.message(
      'Routing number should be of 9 numerical digits',
      name: 'routingNumberShouldBeOf9NumericalDigits',
      desc: '',
      args: [],
    );
  }

  /// `Transit number can not be empty`
  String get transitNumberCanNotBeEmpty {
    return Intl.message(
      'Transit number can not be empty',
      name: 'transitNumberCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Transit number should not be less than 5\nnumerical digits`
  String get transitNumberShouldNotBeLessThan5NumericalDigits {
    return Intl.message(
      'Transit number should not be less than 5\nnumerical digits',
      name: 'transitNumberShouldNotBeLessThan5NumericalDigits',
      desc: '',
      args: [],
    );
  }

  /// `Transit number should not be more than 20\nnumerical digits`
  String get transitNumberShouldNotBeMoreThan20NumericalDigits {
    return Intl.message(
      'Transit number should not be more than 20\nnumerical digits',
      name: 'transitNumberShouldNotBeMoreThan20NumericalDigits',
      desc: '',
      args: [],
    );
  }

  /// `BSB number can not be empty`
  String get bsbNumberCannotBeEmpty {
    return Intl.message(
      'BSB number can not be empty',
      name: 'bsbNumberCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `BSB number should be of 6 numerical digits`
  String get bsbNumberShouldBeOf6NumericalDigits {
    return Intl.message(
      'BSB number should be of 6 numerical digits',
      name: 'bsbNumberShouldBeOf6NumericalDigits',
      desc: '',
      args: [],
    );
  }

  /// `Bank code / Branch code can not be empty`
  String get branchCodeCannotBeEmpty {
    return Intl.message(
      'Bank code / Branch code can not be empty',
      name: 'branchCodeCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Bank code / Branch code should be 7 digit alpha-numeric code`
  String get branchCodeShouldBe7DigitAlphaNumericCode {
    return Intl.message(
      'Bank code / Branch code should be 7 digit alpha-numeric code',
      name: 'branchCodeShouldBe7DigitAlphaNumericCode',
      desc: '',
      args: [],
    );
  }

  /// `IFSC code can not be empty`
  String get ifscCodeCannotBeEmpty {
    return Intl.message(
      'IFSC code can not be empty',
      name: 'ifscCodeCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `IFSC code should be 11 digit alpha-numeric code`
  String get ifscCodeShouldBe11DigitAlphaNumericCode {
    return Intl.message(
      'IFSC code should be 11 digit alpha-numeric code',
      name: 'ifscCodeShouldBe11DigitAlphaNumericCode',
      desc: '',
      args: [],
    );
  }

  /// `value can not be empty`
  String get valueCanNotBeEmpty {
    return Intl.message(
      'value can not be empty',
      name: 'valueCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Bank branch city can not be empty`
  String get bankBranchCityCannotBeEmpty {
    return Intl.message(
      'Bank branch city can not be empty',
      name: 'bankBranchCityCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Iban cannot be empty`
  String get ibanCannotBeEmpty {
    return Intl.message(
      'Iban cannot be empty',
      name: 'ibanCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Apartment / House Number cannot be empty`
  String get apartmentHouseNumberCannotBeEmpty {
    return Intl.message(
      'Apartment / House Number cannot be empty',
      name: 'apartmentHouseNumberCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Apartment / House Number should not be\nmore than 4 numerical digits`
  String get apartmentHouseNumberShouldNotBeMoreThan4NumericalDigits {
    return Intl.message(
      'Apartment / House Number should not be\nmore than 4 numerical digits',
      name: 'apartmentHouseNumberShouldNotBeMoreThan4NumericalDigits',
      desc: '',
      args: [],
    );
  }

  /// `Street name should not be empty`
  String get streetNameShouldNotBeEmpty {
    return Intl.message(
      'Street name should not be empty',
      name: 'streetNameShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 25 characters allowed`
  String get streetMax25 {
    return Intl.message(
      'Maximum 25 characters allowed',
      name: 'streetMax25',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 7 numbers allowed`
  String get maxLength7numbers {
    return Intl.message(
      'Maximum 7 numbers allowed',
      name: 'maxLength7numbers',
      desc: '',
      args: [],
    );
  }

  /// `Only numbers allowed`
  String get onlyNumbersAllowed {
    return Intl.message(
      'Only numbers allowed',
      name: 'onlyNumbersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Street name number should not be empty`
  String get streetNameNumberShouldNotBeEmpty {
    return Intl.message(
      'Street name number should not be empty',
      name: 'streetNameNumberShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid street number and name`
  String get pleaseEnterValidStreetNumberAndName {
    return Intl.message(
      'Please enter valid street number and name',
      name: 'pleaseEnterValidStreetNumberAndName',
      desc: '',
      args: [],
    );
  }

  /// `Street number should not be empty`
  String get streetNumberShouldNotBeEmpty {
    return Intl.message(
      'Street number should not be empty',
      name: 'streetNumberShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Street number should be numeric`
  String get streetNumberShouldBeNumeric {
    return Intl.message(
      'Street number should be numeric',
      name: 'streetNumberShouldBeNumeric',
      desc: '',
      args: [],
    );
  }

  /// `Street number should not be more then\n3 Numerical Digits`
  String get streetNumberShouldNotBeMoreThen3NumericalDigits {
    return Intl.message(
      'Street number should not be more then\n3 Numerical Digits',
      name: 'streetNumberShouldNotBeMoreThen3NumericalDigits',
      desc: '',
      args: [],
    );
  }

  /// `Street name should alphabetic Characters`
  String get streetNameShouldBeAlphabeticChars {
    return Intl.message(
      'Street name should alphabetic Characters',
      name: 'streetNameShouldBeAlphabeticChars',
      desc: '',
      args: [],
    );
  }

  /// `Street name should not be more then \n30 alphabetic Characters`
  String get streetNameShouldNotBeMoreThen30AlphabeticChars {
    return Intl.message(
      'Street name should not be more then \n30 alphabetic Characters',
      name: 'streetNameShouldNotBeMoreThen30AlphabeticChars',
      desc: '',
      args: [],
    );
  }

  /// `Post code should not be empty`
  String get postCodeShouldNotBeEmpty {
    return Intl.message(
      'Post code should not be empty',
      name: 'postCodeShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid post code`
  String get pleaseEnterValidPostCode {
    return Intl.message(
      'Please enter valid post code',
      name: 'pleaseEnterValidPostCode',
      desc: '',
      args: [],
    );
  }

  /// `Post code should not contain/be more than\n7 alpha numeric characters`
  String get postCodeShouldNotMoreThan7AlphaNumericChars {
    return Intl.message(
      'Post code should not contain/be more than\n7 alpha numeric characters',
      name: 'postCodeShouldNotMoreThan7AlphaNumericChars',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot contain multiple spaces in a row`
  String get nameCannotContainMultipleSpacesInRow {
    return Intl.message(
      'Name cannot contain multiple spaces in a row',
      name: 'nameCannotContainMultipleSpacesInRow',
      desc: '',
      args: [],
    );
  }

  /// `Please enter at least 2 names with a minimum of 3 characters in the first and last name`
  String get beneficiaryNameValidationMessage {
    return Intl.message(
      'Please enter at least 2 names with a minimum of 3 characters in the first and last name',
      name: 'beneficiaryNameValidationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 15 digits.`
  String get mobileTooLong {
    return Intl.message(
      'Maximum 15 digits.',
      name: 'mobileTooLong',
      desc: '',
      args: [],
    );
  }

  /// `At least 10 digits long`
  String get mobileTooShort {
    return Intl.message(
      'At least 10 digits long',
      name: 'mobileTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Entered mobile number format is incorrect`
  String get invalidMobileFormat {
    return Intl.message(
      'Entered mobile number format is incorrect',
      name: 'invalidMobileFormat',
      desc: '',
      args: [],
    );
  }

  /// `Please select start date`
  String get pleaseSelectStartDate {
    return Intl.message(
      'Please select start date',
      name: 'pleaseSelectStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Please select end date`
  String get pleaseSelectEndDate {
    return Intl.message(
      'Please select end date',
      name: 'pleaseSelectEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter name as per passport`
  String get pleaseEnterNameAsPerPassport {
    return Intl.message(
      'Please enter name as per passport',
      name: 'pleaseEnterNameAsPerPassport',
      desc: '',
      args: [],
    );
  }

  /// `Please include both first and family names`
  String get pleaseIncludeBothFirstAndFamilyName {
    return Intl.message(
      'Please include both first and family names',
      name: 'pleaseIncludeBothFirstAndFamilyName',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 100 characters allowed`
  String get maximum100CharactersAllowed {
    return Intl.message(
      'Maximum 100 characters allowed',
      name: 'maximum100CharactersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter passport number`
  String get pleaseEnterPassportNumber {
    return Intl.message(
      'Please enter passport number',
      name: 'pleaseEnterPassportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Passport number must include letters and cannot be only digits`
  String get passportNumberMustIncludeLetters {
    return Intl.message(
      'Passport number must include letters and cannot be only digits',
      name: 'passportNumberMustIncludeLetters',
      desc: '',
      args: [],
    );
  }

  /// `Passport number must include digits and cannot be only letters`
  String get passportMustIncludeDigitsAndLetters {
    return Intl.message(
      'Passport number must include digits and cannot be only letters',
      name: 'passportMustIncludeDigitsAndLetters',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 20 characters allowed`
  String get maximum20CharactersAllowed {
    return Intl.message(
      'Maximum 20 characters allowed',
      name: 'maximum20CharactersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder name can not be empty`
  String get cardholderNameCanNotBeEmpty {
    return Intl.message(
      'Cardholder name can not be empty',
      name: 'cardholderNameCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 25 characters allowed`
  String get maximum25CharactersAllowed {
    return Intl.message(
      'Maximum 25 characters allowed',
      name: 'maximum25CharactersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `cannot be empty`
  String get cannotBeEmpty {
    return Intl.message(
      'cannot be empty',
      name: 'cannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `should be of`
  String get shouldBeOf {
    return Intl.message('should be of', name: 'shouldBeOf', desc: '', args: []);
  }

  /// `digits`
  String get digits {
    return Intl.message('digits', name: 'digits', desc: '', args: []);
  }

  /// `Beneficiary first name cannot be empty`
  String get beneficiaryFirstNameCannotBeEmpty {
    return Intl.message(
      'Beneficiary first name cannot be empty',
      name: 'beneficiaryFirstNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 3 characters allowed`
  String get minimum3CharactersAllowed {
    return Intl.message(
      'Minimum 3 characters allowed',
      name: 'minimum3CharactersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 40 characters allowed`
  String get maximum40CharactersAllowed {
    return Intl.message(
      'Maximum 40 characters allowed',
      name: 'maximum40CharactersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 35 characters allowed`
  String get maximum35CharAllowed {
    return Intl.message(
      'Maximum 35 characters allowed',
      name: 'maximum35CharAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Middle name can only contain alphabetic characters, commas, spaces and dashes`
  String get middleNameCanOnlyContainAlphabeticCharactersCommasSpacesAndDashes {
    return Intl.message(
      'Middle name can only contain alphabetic characters, commas, spaces and dashes',
      name: 'middleNameCanOnlyContainAlphabeticCharactersCommasSpacesAndDashes',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary last name cannot be empty`
  String get beneficiaryLastNameCannotBeEmpty {
    return Intl.message(
      'Beneficiary last name cannot be empty',
      name: 'beneficiaryLastNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary nickname cannot be empty`
  String get beneficiaryNickNameCannotBeEmpty {
    return Intl.message(
      'Beneficiary nickname cannot be empty',
      name: 'beneficiaryNickNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 15 characters allowed`
  String get maximum15CharactersAllowed {
    return Intl.message(
      'Maximum 15 characters allowed',
      name: 'maximum15CharactersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Delivery method cannot be empty`
  String get deliveryMethodCannotBeEmpty {
    return Intl.message(
      'Delivery method cannot be empty',
      name: 'deliveryMethodCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary nationality cannot be empty`
  String get beneficiaryNationalityCannotBeEmpty {
    return Intl.message(
      'Beneficiary nationality cannot be empty',
      name: 'beneficiaryNationalityCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary state cannot be empty`
  String get beneficiaryStateCannotBeEmpty {
    return Intl.message(
      'Beneficiary state cannot be empty',
      name: 'beneficiaryStateCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary city cannot be empty`
  String get beneficiaryCityCannotBeEmpty {
    return Intl.message(
      'Beneficiary city cannot be empty',
      name: 'beneficiaryCityCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Purpose of transfer cannot be empty`
  String get purposeOfTransferCannotBeEmpty {
    return Intl.message(
      'Purpose of transfer cannot be empty',
      name: 'purposeOfTransferCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `City cannot be empty`
  String get cityCannotBeEmpty {
    return Intl.message(
      'City cannot be empty',
      name: 'cityCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Building number cannot be empty`
  String get buildingNumberCannotBeEmpty {
    return Intl.message(
      'Building number cannot be empty',
      name: 'buildingNumberCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 4 digits allowed`
  String get maximum4DigitsAllowed {
    return Intl.message(
      'Maximum 4 digits allowed',
      name: 'maximum4DigitsAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Verify Mobile`
  String get verifyMobile {
    return Intl.message(
      'Verify Mobile',
      name: 'verifyMobile',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code sent to mobile number`
  String get pleaseEnterTheVerificationCodeSentToMobile {
    return Intl.message(
      'Please enter the verification code sent to mobile number',
      name: 'pleaseEnterTheVerificationCodeSentToMobile',
      desc: '',
      args: [],
    );
  }

  /// `Device Registration`
  String get deviceRegistration {
    return Intl.message(
      'Device Registration',
      name: 'deviceRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password or Username`
  String get forgotPasswordOrUsername {
    return Intl.message(
      'Forgot Password or Username',
      name: 'forgotPasswordOrUsername',
      desc: '',
      args: [],
    );
  }

  /// `Personal & Customer Information`
  String get personalAndCustomerInformation {
    return Intl.message(
      'Personal & Customer Information',
      name: 'personalAndCustomerInformation',
      desc: '',
      args: [],
    );
  }

  /// `Customer Information`
  String get customerInformation {
    return Intl.message(
      'Customer Information',
      name: 'customerInformation',
      desc: '',
      args: [],
    );
  }

  /// `Scan ID`
  String get scanId {
    return Intl.message('Scan ID', name: 'scanId', desc: '', args: []);
  }

  /// `The ID will be encrypted, stored securely, and only used to verify your identity.`
  String get theIdWillBeEncryptedStored {
    return Intl.message(
      'The ID will be encrypted, stored securely, and only used to verify your identity.',
      name: 'theIdWillBeEncryptedStored',
      desc: '',
      args: [],
    );
  }

  /// `A valid`
  String get aValid {
    return Intl.message('A valid', name: 'aValid', desc: '', args: []);
  }

  /// `Jordanian national ID`
  String get jordanianID {
    return Intl.message(
      'Jordanian national ID',
      name: 'jordanianID',
      desc: '',
      args: [],
    );
  }

  /// `is required to be scanned front and back sides. We will check your identity and information as per your ID.`
  String get isRequiredToBeScannedFront {
    return Intl.message(
      'is required to be scanned front and back sides. We will check your identity and information as per your ID.',
      name: 'isRequiredToBeScannedFront',
      desc: '',
      args: [],
    );
  }

  /// `New device detected`
  String get idWiseNewDeviceDetected {
    return Intl.message(
      'New device detected',
      name: 'idWiseNewDeviceDetected',
      desc: '',
      args: [],
    );
  }

  /// `For your security, please confirm your identity to continue on this device.`
  String get idWiseNewDeviceDetectedDesc {
    return Intl.message(
      'For your security, please confirm your identity to continue on this device.',
      name: 'idWiseNewDeviceDetectedDesc',
      desc: '',
      args: [],
    );
  }

  /// `Verification Steps`
  String get idWiseVerificationSteps {
    return Intl.message(
      'Verification Steps',
      name: 'idWiseVerificationSteps',
      desc: '',
      args: [],
    );
  }

  /// `Identity validation`
  String get idWiseIdentityValidation {
    return Intl.message(
      'Identity validation',
      name: 'idWiseIdentityValidation',
      desc: '',
      args: [],
    );
  }

  /// `We’ll verify your personal details to confirm it’s really you. Please have your ID document ready and be prepared to take a quick selfie.`
  String get idWiseIdentityValidationDesc {
    return Intl.message(
      'We’ll verify your personal details to confirm it’s really you. Please have your ID document ready and be prepared to take a quick selfie.',
      name: 'idWiseIdentityValidationDesc',
      desc: '',
      args: [],
    );
  }

  /// `OTP verification`
  String get idWiseOTPVerification {
    return Intl.message(
      'OTP verification',
      name: 'idWiseOTPVerification',
      desc: '',
      args: [],
    );
  }

  /// `A one-time password (OTP) will be sent to your registered phone number to confirm this login.`
  String get idWiseOTPVerificationDesc {
    return Intl.message(
      'A one-time password (OTP) will be sent to your registered phone number to confirm this login.',
      name: 'idWiseOTPVerificationDesc',
      desc: '',
      args: [],
    );
  }

  /// `Device approval`
  String get idWiseDeviceApproval {
    return Intl.message(
      'Device approval',
      name: 'idWiseDeviceApproval',
      desc: '',
      args: [],
    );
  }

  /// `Once verification is complete, this device will be trusted, and you’ll be able to securely access your account.`
  String get idWiseDeviceApprovalDesc {
    return Intl.message(
      'Once verification is complete, this device will be trusted, and you’ll be able to securely access your account.',
      name: 'idWiseDeviceApprovalDesc',
      desc: '',
      args: [],
    );
  }

  /// `Why these steps matter`
  String get idWiseWhyTheseStepsMatter {
    return Intl.message(
      'Why these steps matter',
      name: 'idWiseWhyTheseStepsMatter',
      desc: '',
      args: [],
    );
  }

  /// `These steps help us make sure it’s really you and keep your account safe!`
  String get idWiseWhyTheseStepsMatterDesc {
    return Intl.message(
      'These steps help us make sure it’s really you and keep your account safe!',
      name: 'idWiseWhyTheseStepsMatterDesc',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Notice`
  String get privacyNoticeForgetPasswordAndChangeDeviceFlow {
    return Intl.message(
      'Privacy Notice',
      name: 'privacyNoticeForgetPasswordAndChangeDeviceFlow',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `ID Scan`
  String get idScan {
    return Intl.message('ID Scan', name: 'idScan', desc: '', args: []);
  }

  /// `The ID will be encrypted, stored securely, and only used to verify your identity.`
  String get theIdWillBeEncryptedStoredSecurelyAndOnlyUsedToVerifyYourIdentity {
    return Intl.message(
      'The ID will be encrypted, stored securely, and only used to verify your identity.',
      name: 'theIdWillBeEncryptedStoredSecurelyAndOnlyUsedToVerifyYourIdentity',
      desc: '',
      args: [],
    );
  }

  /// `A valid`
  String get aValidScan {
    return Intl.message('A valid', name: 'aValidScan', desc: '', args: []);
  }

  /// ` is required to be scanned front and back sides. We will check your identity and information with the card issuer. The data/ID image will be securely stored in accordance with legal and regulatory requirements.`
  String
  get isRequiredToBeScannedFrontAndBackSidesWeWillCheckYourIdentityAndInformationAsPerYourId {
    return Intl.message(
      ' is required to be scanned front and back sides. We will check your identity and information with the card issuer. The data/ID image will be securely stored in accordance with legal and regulatory requirements.',
      name: 'isRequiredToBeScannedFrontAndBackSidesWeWillCheckYourIdentityAndInformationAsPerYourId',
      desc: '',
      args: [],
    );
  }

  /// `We need your Jordanian ID card to check that you are a real person. Get them ready to scan.`
  String get weNeedYourJordinianIdCardToCheck {
    return Intl.message(
      'We need your Jordanian ID card to check that you are a real person. Get them ready to scan.',
      name: 'weNeedYourJordinianIdCardToCheck',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Notice`
  String get privacyNotice {
    return Intl.message(
      'Privacy Notice',
      name: 'privacyNotice',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the`
  String get iAgreeToThe {
    return Intl.message(
      'I agree to the',
      name: 'iAgreeToThe',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Start Verification`
  String get idWiseStartVerification {
    return Intl.message(
      'Start Verification',
      name: 'idWiseStartVerification',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you’re in bright place`
  String get makeSureYouReInBrightPlace {
    return Intl.message(
      'Make sure you’re in bright place',
      name: 'makeSureYouReInBrightPlace',
      desc: '',
      args: [],
    );
  }

  /// `Place your ID inside the frame`
  String get placeYourIdInsideTheFrame {
    return Intl.message(
      'Place your ID inside the frame',
      name: 'placeYourIdInsideTheFrame',
      desc: '',
      args: [],
    );
  }

  /// `Once fit, it will scan automatically`
  String get onceFitItWillScanAutomatically {
    return Intl.message(
      'Once fit, it will scan automatically',
      name: 'onceFitItWillScanAutomatically',
      desc: '',
      args: [],
    );
  }

  /// `Name as per ID`
  String get nameAsPerId {
    return Intl.message(
      'Name as per ID',
      name: 'nameAsPerId',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get nationalId {
    return Intl.message('National ID', name: 'nationalId', desc: '', args: []);
  }

  /// `ID Number`
  String get idNumber {
    return Intl.message('ID Number', name: 'idNumber', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get placeOfBirth {
    return Intl.message(
      'Place of Birth',
      name: 'placeOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Mother’s Name`
  String get motherSName {
    return Intl.message(
      'Mother’s Name',
      name: 'motherSName',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiryDate {
    return Intl.message('Expiry Date', name: 'expiryDate', desc: '', args: []);
  }

  /// `ID Issuing Place`
  String get iDIssuingPlace {
    return Intl.message(
      'ID Issuing Place',
      name: 'iDIssuingPlace',
      desc: '',
      args: [],
    );
  }

  /// `I confirm and agree that all my ID details are correct`
  String get iConfirmAndAgreeThatAllMyIdDetailsAreCorrect {
    return Intl.message(
      'I confirm and agree that all my ID details are correct',
      name: 'iConfirmAndAgreeThatAllMyIdDetailsAreCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your Information below and confirm if it correct and accurate.`
  String get pleaseVerifyYourIfItCorrectAndAccurate {
    return Intl.message(
      'Please verify your Information below and confirm if it correct and accurate.',
      name: 'pleaseVerifyYourIfItCorrectAndAccurate',
      desc: '',
      args: [],
    );
  }

  /// `Maybe Later`
  String get mayBeLater {
    return Intl.message('Maybe Later', name: 'mayBeLater', desc: '', args: []);
  }

  /// `Enable Biometric Login`
  String get enableBiometricLogin {
    return Intl.message(
      'Enable Biometric Login',
      name: 'enableBiometricLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please enable biometric login from application when prompted.`
  String get enableBiometricText {
    return Intl.message(
      'Please enable biometric login from application when prompted.',
      name: 'enableBiometricText',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get enableText {
    return Intl.message('Enable', name: 'enableText', desc: '', args: []);
  }

  /// `Please enable biometric login from application when prompted.`
  String get pleaseEnableBiometricLoginFromApplicationWhenPrompted {
    return Intl.message(
      'Please enable biometric login from application when prompted.',
      name: 'pleaseEnableBiometricLoginFromApplicationWhenPrompted',
      desc: '',
      args: [],
    );
  }

  /// `The 6-digit PIN will be used each time you access your account or as backup to your biometric login`
  String get pinCreateHint {
    return Intl.message(
      'The 6-digit PIN will be used each time you access your account or as backup to your biometric login',
      name: 'pinCreateHint',
      desc: '',
      args: [],
    );
  }

  /// `Create App PIN`
  String get createAppPin {
    return Intl.message(
      'Create App PIN',
      name: 'createAppPin',
      desc: '',
      args: [],
    );
  }

  /// `Please create a 6-digit PIN for the app.`
  String get pleaseCreate6DigitPin {
    return Intl.message(
      'Please create a 6-digit PIN for the app.',
      name: 'pleaseCreate6DigitPin',
      desc: '',
      args: [],
    );
  }

  /// `Confirm App PIN`
  String get confirmAppPin {
    return Intl.message(
      'Confirm App PIN',
      name: 'confirmAppPin',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `YOUR CAR, SIMPLIFIED`
  String get onboardingOneEyebrow {
    return Intl.message(
      'YOUR CAR, SIMPLIFIED',
      name: 'onboardingOneEyebrow',
      desc: '',
      args: [],
    );
  }

  /// `Everything your car needs, in one place`
  String get onboardingOneTitle {
    return Intl.message(
      'Everything your car needs, in one place',
      name: 'onboardingOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Track every detail and keep your vehicle information organized wherever you go.`
  String get onboardingOneDescription {
    return Intl.message(
      'Track every detail and keep your vehicle information organized wherever you go.',
      name: 'onboardingOneDescription',
      desc: '',
      args: [],
    );
  }

  /// `STAY IN CONTROL`
  String get onboardingTwoEyebrow {
    return Intl.message(
      'STAY IN CONTROL',
      name: 'onboardingTwoEyebrow',
      desc: '',
      args: [],
    );
  }

  /// `Never miss what matters`
  String get onboardingTwoTitle {
    return Intl.message(
      'Never miss what matters',
      name: 'onboardingTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Keep up with fuel, maintenance, expenses, and important reminders.`
  String get onboardingTwoDescription {
    return Intl.message(
      'Keep up with fuel, maintenance, expenses, and important reminders.',
      name: 'onboardingTwoDescription',
      desc: '',
      args: [],
    );
  }

  /// `DRIVE WITH CONFIDENCE`
  String get onboardingThreeEyebrow {
    return Intl.message(
      'DRIVE WITH CONFIDENCE',
      name: 'onboardingThreeEyebrow',
      desc: '',
      args: [],
    );
  }

  /// `Smarter insights for every journey`
  String get onboardingThreeTitle {
    return Intl.message(
      'Smarter insights for every journey',
      name: 'onboardingThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Understand your car better and make every drive more informed.`
  String get onboardingThreeDescription {
    return Intl.message(
      'Understand your car better and make every drive more informed.',
      name: 'onboardingThreeDescription',
      desc: '',
      args: [],
    );
  }

  String get loginWelcome => Intl.message('Welcome back', name: 'loginWelcome', args: []);
  String get loginDescription => Intl.message('Log in to continue managing your car.', name: 'loginDescription', args: []);
  String get forgotPassword => Intl.message('Forgot password?', name: 'forgotPassword', args: []);
  String get continueText => Intl.message('Continue', name: 'continueText', args: []);
  String get emailRequired => Intl.message('Email is required', name: 'emailRequired', args: []);
  String get emailInvalid => Intl.message('Enter a valid email address', name: 'emailInvalid', args: []);
  String get emailTooLong => Intl.message('Email must not exceed 320 characters', name: 'emailTooLong', args: []);
  String get passwordRequired => Intl.message('Password is required', name: 'passwordRequired', args: []);
  String get passwordTooLong => Intl.message('Password must not exceed 72 characters', name: 'passwordTooLong', args: []);
  String get invalidCredentials => Intl.message('Email or password is incorrect', name: 'invalidCredentials', args: []);
  String get emailNotVerified => Intl.message('Email verification is required', name: 'emailNotVerified', args: []);
  String get validationError => Intl.message('Please check the entered information', name: 'validationError', args: []);
  String get loginUnknownError => Intl.message('Unable to log in. Please try again.', name: 'loginUnknownError', args: []);
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
