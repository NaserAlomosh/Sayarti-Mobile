import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:sayarti_mobile/presentation/core/helper/navigator_key/app_key.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingManager {
  LoadingManager._();

  static bool _isShowing = false;

  static bool get isShowing => _isShowing;

  static Future<void> show({
    bool barrierDismissible = false,
    Color barrierColor = Colors.transparent,
  }) async {
    if (_isShowing) return;
barrierColor = Colors.white.withValues(alpha: 0.2);
    final context = AppKey.navigatorContext;

    _isShowing = true;

    try {
      await showGeneralDialog<void>(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        barrierLabel: 'Loading',
        transitionDuration: Duration.zero,
        pageBuilder: (_, _, _) => const _LoadingView(),
      );
    } finally {
      _isShowing = false;
    }
  }

  static void hide() {
    if (!_isShowing) return;

    final navigator = AppKey.navigatorState;

    if (navigator?.canPop() ?? false) {
      navigator!.pop();
    } else {
      _isShowing = false;
    }
  }

  static Widget widget({
    double size = 60,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: Lottie.asset(
        AppImages.capitalLoaderAnimation,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: _Loader(),
        ),
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) {
    return LoadingManager.widget();
  }
}