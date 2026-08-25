part of '../splash_view.dart';

class _SplashLoadingIndicator extends StatefulWidget {
  const _SplashLoadingIndicator();

  @override
  State<_SplashLoadingIndicator> createState() =>
      _SplashLoadingIndicatorState();
}

class _SplashLoadingIndicatorState
    extends State<_SplashLoadingIndicator>
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

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    _controller.addStatusListener(_onAnimationStatusChanged);

    _controller.forward();
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed && mounted) {
      context.read<SplashCubit>().initSplash();
    }
  }

  @override
  void dispose() {
    _controller
      ..removeStatusListener(_onAnimationStatusChanged)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final secondary =
        Theme.of(context).colorScheme.secondary;

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
                  width: constraints.maxWidth,
                  height: 2,
                  decoration: BoxDecoration(
                    color: secondary.withValues(
                      alpha: 0.20,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Container(
                      width:
                          constraints.maxWidth * _animation.value,
                      height: 2,
                      decoration: BoxDecoration(
                        color: secondary,
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