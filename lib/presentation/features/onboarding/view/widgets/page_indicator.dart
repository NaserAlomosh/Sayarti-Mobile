part of '../onboarding_view.dart';

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.pageCount,
    required this.selectedPage,
  });

  final int pageCount;
  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(pageCount, (index) {
        final selected = index == selectedPage;
        return AnimatedContainer(
          key: ValueKey('onboarding_indicator_$index'),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: selected ? 24 : 8,
          height: 8,
          margin: EdgeInsetsDirectional.only(
            end: index == pageCount - 1 ? 0 : 8,
          ),
          decoration: BoxDecoration(
            color: selected
                ? colors.primary
                : colors.primary.withValues(alpha: .22),
            borderRadius: BorderRadius.circular(99),
          ),
        );
      }),
    );
  }
}
