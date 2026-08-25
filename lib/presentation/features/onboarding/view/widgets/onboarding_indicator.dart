part of '../onboarding_view.dart';

class _OnboardingIndicator extends StatelessWidget {
  const _OnboardingIndicator({
    required this.currentPage,
    required this.pagesCount,
  });

  final int currentPage;
  final int pagesCount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        pagesCount,
        (index) {
          final isSelected = index == currentPage;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: isSelected ? 24 : 8,
            height: 8,
            margin: const EdgeInsetsDirectional.symmetric(
              horizontal: 4,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurface.withValues(
                      alpha: .20,
                    ),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }
}