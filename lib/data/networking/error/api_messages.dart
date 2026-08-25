import 'package:sayarti_mobile/presentation/core/widgets/language/cubit/languge_cubit.dart';

AppLanguage appLanguage = AppLanguage.english;

class ApiMessages {
  ApiMessages._();

  static bool get isArabic => appLanguage == AppLanguage.arabic;

  static String get unknownError => isArabic
      ? 'هناك مشكلة بالاتصال، يرجى التأكد ان الجهاز متصل بشبكة الانترنت'
      : 'Connectivity issue, please make sure the device is connected to the internet';

  static String get noInternet => isArabic
      ? 'فشل الاتصال بالخادم بسبب مشكلة في الإنترنت'
      : 'Connection to API server failed due to internet connection';

  static String get timeout => isArabic
      ? 'انتهت مهلة الاتصال مع الخادم'
      : 'Connection timeout with API server';

  static String get requestCancelled => isArabic
      ? 'تم إلغاء الطلب'
      : 'Request to API server was cancelled';

  static String get invalidResponse => isArabic
      ? 'تم استلام استجابة غير صالحة من الخادم'
      : 'Invalid response received from API server';

  static String get serverError => isArabic
      ? 'حدث خطأ في الخادم'
      : 'Server error';
  // unauthorized
  static String get unauthorized => isArabic
      ? 'أنتهت صلاحية الجلسة'
      : 'Session timeout';
  static String get unknown => isArabic
      ? 'حدث خطأ ما'
      : 'Something went wrong';

  static String get success => isArabic
    ? 'تمت العملية بنجاح'
    : 'Operation completed successfully';
}
