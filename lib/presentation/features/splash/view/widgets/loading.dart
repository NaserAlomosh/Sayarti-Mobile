part of '../splash_view.dart';

class _SplashLoadingIndicator extends StatefulWidget {
  const _SplashLoadingIndicator();

  @override
  State<_SplashLoadingIndicator> createState() =>
      _SplashLoadingIndicatorState();
}

class _SplashLoadingIndicatorState extends State<_SplashLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 140,
      height: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  key: SplashView.loadingTrackKey,
                  width: constraints.maxWidth,
                  height: 2,
                  decoration: BoxDecoration(
                    color: colorScheme.secondary.withValues(alpha: 0.20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Container(
                      key: SplashView.loadingProgressKey,
                      width: constraints.maxWidth * _animation.value,
                      height: 2,
                      decoration: BoxDecoration(
                        color: colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
