part of '../onboarding_view.dart';

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.item,
    required this.indicator,
    required this.ctaText,
    required this.onPressed,
  });

  final _OnboardingItem item;
  final Widget indicator;
  final String ctaText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.sizeOf(context).height;
    final imageHeight = (screenHeight * .53).clamp(300.0, 520.0);

    return Column(
      children: [
        SizedBox(
          height: imageHeight,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppImages.onboardingPng,
                fit: BoxFit.cover,
                alignment: item.imageAlignment,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [.58, .82, 1],
                    colors: [
                      Colors.transparent,
                      theme.colorScheme.surface.withValues(alpha: .55),
                      theme.colorScheme.surface,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
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
                      color: theme.colorScheme.primary,
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
                  Center(child: indicator),
                  const SizedBox(height: 24),
                  CustomAppButton(
                    text: ctaText,
                    onPressed: onPressed,
                    height: 56,
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
