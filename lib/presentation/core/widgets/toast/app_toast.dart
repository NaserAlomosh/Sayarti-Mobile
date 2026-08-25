
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/helper/navigator_key/app_key.dart';
import 'package:sayarti_mobile/presentation/core/widgets/toast/another_flushbar_custom_widget.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class AppToast {
  AppToast._();

  static Future<dynamic> success(
 {  String? title,
    String description = '',
    int seconds = 5,
  }) {
    return _show(
      title: title ?? S.of(AppKey.navigatorContext).success,
      description: description,
      backgroundColor: AppColor.green,
      icon: Icons.check_circle_outline,
      seconds: seconds,
    );
  }

  static Future<dynamic> error(
  {
    String? title, 
    String description = '',
    int seconds = 5,
  }) {
    return _show(
      title: title ?? S.of(AppKey.navigatorContext).error,
      description: description,
      backgroundColor: AppColor.red,
      icon: Icons.error_outline,
      seconds: seconds,
    );
  }

  static Future<dynamic> _show({
    required String title,
    required String description,
    required Color backgroundColor,
    required IconData icon,
    required int seconds,
  }) {
    final navigatorState = AppKey.navigatorState;
    final context = navigatorState?.context;

    if (context == null) {
      return Future.value();
    }

    return AnotherFlushbarCustomWidget(
      titleText: Text(
        title,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      messageText: Text(
        description,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      icon: Icon(
        icon,
        color: AppColor.white,
        size: 26,
      ),
      shouldIconPulse: false,
      backgroundColor: backgroundColor,
      flushbarPosition: FlushbarPosition.top,
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      borderRadius: BorderRadius.circular(16),
      mainButton: IconButton(
        onPressed: () {
          final navigator = AppKey.navigatorState;

          if (navigator?.canPop() == true) {
            navigator?.pop();
          }
        },
        icon: const Icon(
          Icons.close,
          color: AppColor.white,
        ),
      ),
      duration: Duration(seconds: seconds),
      animationDuration: const Duration(milliseconds: 700),
    ).show(context);
  }
}