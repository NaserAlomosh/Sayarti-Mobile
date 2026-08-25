part of '../splash_view.dart';

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        /// Background image
        Image.asset(
          AppImages.splashPng,
          key: SplashView.backgroundImageKey,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),

        /// Bottom dark overlay to make logo/loading match Figma better
        Align(
          alignment: Alignment.bottomCenter,
          child: IgnorePointer(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.10),
                    Colors.black.withValues(alpha: 0.45),
                  ],
                ),
              ),
            ),
          ),
        ),

        /// Logo + Loading
        SafeArea(
          child: Align(
            alignment: const Alignment(0, 0.76),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 38),

                const _SplashLoadingIndicator(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
