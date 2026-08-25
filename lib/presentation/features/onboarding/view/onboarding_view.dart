import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayarti_mobile/data/di/injection.dart';
import 'package:sayarti_mobile/data/service/local/onboarding/onboarding_storage.dart';
import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:sayarti_mobile/presentation/core/routing/routes.dart';
import 'package:sayarti_mobile/presentation/core/widgets/button/custom_app_button.dart';
import 'package:sayarti_mobile/presentation/core/widgets/text/custom_text.dart';

part 'widgets/onboarding_page.dart';
part 'widgets/page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({
    super.key,
    this.storage,
    this.onCompleted,
  });

  final OnboardingStorage? storage;
  final VoidCallback? onCompleted;

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;
  int _selectedPage = 0;

  OnboardingStorage get _storage => widget.storage ?? getIt<OnboardingStorage>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<_OnboardingItem> _items(S strings) => [
    _OnboardingItem(
      eyebrow: strings.onboardingOneEyebrow,
      title: strings.onboardingOneTitle,
      description: strings.onboardingOneDescription,
      imageAlignment: Alignment.topCenter,
    ),
    _OnboardingItem(
      eyebrow: strings.onboardingTwoEyebrow,
      title: strings.onboardingTwoTitle,
      description: strings.onboardingTwoDescription,
      imageAlignment: Alignment.center,
    ),
    _OnboardingItem(
      eyebrow: strings.onboardingThreeEyebrow,
      title: strings.onboardingThreeTitle,
      description: strings.onboardingThreeDescription,
      imageAlignment: Alignment.bottomCenter,
    ),
  ];

  Future<void> _complete() async {
    await _storage.complete();
    if (!mounted) return;
    if (widget.onCompleted case final callback?) {
      callback();
      return;
    }
    Navigator.of(context).pushReplacementNamed(Routes.splashView);
  }

  void _next(int pageCount) {
    if (_selectedPage == pageCount - 1) {
      _complete();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final items = _items(strings);
    final colors = Theme.of(context).colorScheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: colors.surface,
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              onPageChanged: (page) => setState(() => _selectedPage = page),
              itemBuilder: (context, index) => _OnboardingPage(
                item: items[index],
                indicator: _PageIndicator(
                  pageCount: items.length,
                  selectedPage: _selectedPage,
                ),
                ctaText: index == items.length - 1
                    ? strings.getStarted
                    : strings.next,
                onPressed: () => _next(items.length),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8, end: 20),
                  child: TextButton(
                    onPressed: _complete,
                    style: TextButton.styleFrom(
                      foregroundColor: colors.onPrimary,
                      backgroundColor: colors.scrim.withValues(alpha: .34),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 9,
                      ),
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      strings.skip,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingItem {
  const _OnboardingItem({
    required this.eyebrow,
    required this.title,
    required this.description,
    required this.imageAlignment,
  });

  final String eyebrow;
  final String title;
  final String description;
  final Alignment imageAlignment;
}
