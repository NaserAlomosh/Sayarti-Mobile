import 'dart:ui';

import 'package:sayarti_mobile/presentation/core/helper/navigator_key/app_key.dart';
import 'package:flutter/material.dart';

class LoadingManager {
  LoadingManager._();

  static bool _isShowing = false;

  static bool get isShowing => _isShowing;

  static Future<void> show({
    bool barrierDismissible = false,
    Color barrierColor = Colors.transparent,
  }) async {
    if (_isShowing) return;
    barrierColor = const Color.fromARGB(184, 0, 0, 0).withValues(alpha: 0.1);
    final context = AppKey.navigatorContext;

    _isShowing = true;

    try {
      await showGeneralDialog<void>(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        barrierLabel: 'Loading',
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          return const SizedBox.shrink();
        },

        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return _LoadingView(animation: animation);
        },
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

  static Widget widget({double size = 60}) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        type: MaterialType.transparency,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final value = Curves.easeOutCubic.transform(animation.value);

            return Stack(
              fit: StackFit.expand,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5 * value,
                    sigmaY: 5 * value,
                  ),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.05 * value),
                  ),
                ),

                Center(
                  child: FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.85, end: 1).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutBack,
                        ),
                      ),
                      child: const _ModernDotsLoader(size: 60),
                    ),
                  ),
                ),
              ],
            );
          },
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

class _ModernLoader extends StatefulWidget {
  const _ModernLoader({required this.size});

  final double size;

  @override
  State<_ModernLoader> createState() => _ModernLoaderState();
}

class _ModernLoaderState extends State<_ModernLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Subtle background ring
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 3,
              color: color.withValues(alpha: 0.12),
            ),
          ),

          // Animated ring
          RotationTransition(
            turns: _controller,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: CircularProgressIndicator(
                value: 0.72,
                strokeWidth: 3,
                strokeCap: StrokeCap.round,
                color: color,
              ),
            ),
          ),

          // Center
          Container(
            width: widget.size * 0.16,
            height: widget.size * 0.16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.35),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernDotsLoader extends StatefulWidget {
  const _ModernDotsLoader({required this.size});

  final double size;

  @override
  State<_ModernDotsLoader> createState() => _ModernDotsLoaderState();
}

class _ModernDotsLoaderState extends State<_ModernDotsLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,

      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    final dotSize = widget.size * 0.18;

    final spacing = widget.size * 0.10;

    return SizedBox(
      height: widget.size,

      child: AnimatedBuilder(
        animation: _controller,

        builder: (context, _) {
          return Row(
            mainAxisSize: MainAxisSize.min,

            mainAxisAlignment: MainAxisAlignment.center,

            children: List.generate(3, (index) {
              final phase = (_controller.value - (index * 0.15)) % 1.0;

              final wave = (1 - (phase - 0.5).abs() * 2).clamp(0.0, 1.0);

              final scale = 0.65 + (wave * 0.35);

              final translateY = -widget.size * 0.12 * wave;

              final opacity = 0.35 + (wave * 0.65);

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing / 2),

                child: Transform.translate(
                  offset: Offset(0, translateY),

                  child: Transform.scale(
                    scale: scale,

                    child: Opacity(
                      opacity: opacity,

                      child: Container(
                        width: dotSize,

                        height: dotSize,

                        decoration: BoxDecoration(
                          color: color,

                          shape: BoxShape.circle,

                          boxShadow: [
                            BoxShadow(
                              color: color.withValues(alpha: 0.25 * wave),

                              blurRadius: 8 + (8 * wave),

                              spreadRadius: wave * 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
