import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:sayarti_mobile/presentation/core/widgets/background/capital_background.dart';

/// The application's Flutter splash surface.
///
/// Startup decisions remain outside this presentational view. In particular,
/// the view intentionally does not introduce a timer or automatic navigation.
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const Key logoKey = Key('splash_logo');

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _SplashContent(),
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primary,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          const DecoratedBox(
            key: Key('splash_background'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.48, 0.78, 1],
                colors: [
                  AppColor.pungentGrey,
                  AppColor.pungentMaroon,
                  AppColor.bloodRed,
                  AppColor.tomatoRed,
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0, 0.58),
            child: CapitalBackground(height: 430),
          ),
          Center(
            child: Semantics(
              label: 'Capital Bank',
              image: true,
              child: SvgPicture.asset(
                AppImages.capitalBank,
                key: SplashView.logoKey,
                width: 222,
                height: 54,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
