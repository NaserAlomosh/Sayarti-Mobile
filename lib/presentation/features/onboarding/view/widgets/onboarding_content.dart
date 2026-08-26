part of '../onboarding_view.dart';

class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent({
    required this.item,
    required this.currentPage,
    required this.pagesCount,
    required this.onPressed,
  });

  final _OnboardingItem item;
  final int currentPage;
  final int pagesCount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Theme.of(context).colorScheme.surface,

      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.eyebrow.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.6,
                ),
              ),

              const SizedBox(height: 12),

              CustomTitleText(
                item.title,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),

              const SizedBox(height: 12),

              CustomDescriptionText(
                item.description,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),

              const Spacer(),

              Center(
                child: _OnboardingIndicator(
                  currentPage: currentPage,
                  pagesCount: pagesCount,
                ),
              ),

              const SizedBox(height: 24),

              CustomAppButton(
                text: S.current.next,
                onPressed: onPressed,
                height: 56,
                borderRadius: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
