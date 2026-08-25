import 'package:flutter/material.dart';

class CapitalBackground extends StatelessWidget {
  const CapitalBackground({
    super.key,
    this.height = 360,
  });

  final double height;

  static const double _circleSize = 430;
  static const double _circleSpacing = 24;

  static const List<double> _opacities = [
    0.30,
    0.10,
    0.20,
    0.30,
    0.40,
    0.50,
    0.50,
    0.40,
    0.30,
    0.15,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: const ClipRect(
        child: OverflowBox(
          minWidth: _circleSize,
          maxWidth: _circleSize,
          minHeight: _circleSize,
          maxHeight: _circleSize,
          child: SizedBox.square(
            dimension: _circleSize,
            child: _CapitalCircles(),
          ),
        ),
      ),
    );
  }
}

class _CapitalCircles extends StatelessWidget {
  const _CapitalCircles();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: List.generate(
        CapitalBackground._opacities.length,
        (index) {
          final inset = index * CapitalBackground._circleSpacing;

          return Positioned.fill(
            left: inset,
            right: inset,
            top: inset,
            bottom: inset,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.5,
                  color: Colors.white.withValues(
                    alpha: CapitalBackground._opacities[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}