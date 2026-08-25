part of '../onboarding_view.dart';

class _OnboardingImagePage extends StatelessWidget {
  const _OnboardingImagePage({
    required this.item,
  });

  final _OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          item.image,
          fit: BoxFit.cover,
          alignment: item.imageAlignment,
        ),

        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                .58,
                .82,
                1,
              ],
              colors: [
                Colors.transparent,
                colorScheme.surface.withValues(alpha: .55),
                colorScheme.surface,
              ],
            ),
          ),
        ),
      ],
    );
  }
}