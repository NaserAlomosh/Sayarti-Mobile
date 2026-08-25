// onboarding_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/base/view/base_view.dart';
import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:sayarti_mobile/presentation/core/widgets/button/custom_app_button.dart';
import 'package:sayarti_mobile/presentation/core/widgets/text/custom_text.dart';
import 'package:sayarti_mobile/presentation/features/onboarding/cubit/onboarding_cubit.dart';

part 'widgets/onboarding_page.dart';
part 'widgets/onboarding_content.dart';
part 'widgets/onboarding_indicator.dart';

class OnboardingView extends BaseView<OnboardingCubit, OnboardingState> {
  const OnboardingView({super.key});

  @override
  Widget buildContent(
    BuildContext context,
    OnboardingCubit cubit,
  ) {
    final items = _items(S.of(context));

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final item = items[state.currentPage];

        return Column(
          children: [
            Expanded(
              flex: 53,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: cubit.pageController,
                    itemCount: items.length,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: cubit.onPageChanged,
                    itemBuilder: (context, index) {
                      return _OnboardingImagePage(
                        item: items[index],
                      );
                    },
                  ),

                  PositionedDirectional(
                    top: 16,
                    end: 22,
                    child: SafeArea(
                      child: GestureDetector(
                        onTap: cubit.skip,
                        child: Text(
                          S.of(context).skip,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 47,
              child: _OnboardingContent(
                item: item,
                currentPage: state.currentPage,
                pagesCount: items.length,
                onPressed: cubit.nextPage,
              ),
            ),
          ],
        );
      },
    );
  }

  List<_OnboardingItem> _items(S strings) => [
        _OnboardingItem(
          image: AppImages.splashPng,
          eyebrow: strings.onboardingOneEyebrow,
          title: strings.onboardingOneTitle,
          description: strings.onboardingOneDescription,
          imageAlignment: Alignment.topCenter,
        ),
        _OnboardingItem(
          image: AppImages.splashPng,
          eyebrow: strings.onboardingTwoEyebrow,
          title: strings.onboardingTwoTitle,
          description: strings.onboardingTwoDescription,
          imageAlignment: Alignment.center,
        ),
        _OnboardingItem(
          image: AppImages.splashPng,
          eyebrow: strings.onboardingThreeEyebrow,
          title: strings.onboardingThreeTitle,
          description: strings.onboardingThreeDescription,
          imageAlignment: Alignment.bottomCenter,
        ),
      ];
}

class _OnboardingItem {
  const _OnboardingItem({
    required this.image,
    required this.eyebrow,
    required this.title,
    required this.description,
    required this.imageAlignment,
  });

  final String image;
  final String eyebrow;
  final String title;
  final String description;
  final Alignment imageAlignment;
}