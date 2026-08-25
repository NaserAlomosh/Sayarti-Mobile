import 'package:flutter/cupertino.dart';
import 'package:sayarti_mobile/presentation/core/routing/routes.dart';
import 'package:sayarti_mobile/presentation/features/splash/view/splash_view.dart';
import 'package:sayarti_mobile/presentation/features/onboarding/view/onboarding_view.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return CupertinoPageRoute<void>(
          settings: settings,
          builder: (_) => const SplashView(),
        );
      case Routes.onboardingView:
        return CupertinoPageRoute<void>(
          settings: settings,
          builder: (_) => const OnboardingView(),
        );
    }
    return null;
  }
}
