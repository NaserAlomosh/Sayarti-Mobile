// onboarding_cubit.dart

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/presentation/core/base/cubit/base_cubit.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

@injectable
class OnboardingCubit extends BaseCubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  final PageController pageController = PageController();

  int pagesCount = 3;

  void onPageChanged(int index) {
    if (state.currentPage == index) return;

    emit(
      state.copyWith(currentPage: index),
      withoutCloseLoading: true,
    );
  }

  Future<void> nextPage() async {
    if (state.currentPage >= pagesCount - 1) {
      await completeOnboarding();
      return;
    }

    await pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  Future<void> skip() async {
    await completeOnboarding();
  }

  Future<void> completeOnboarding() async {
    // TODO:
    // Use the existing OnboardingStorage here.
    // Persist onboarding completion.
    //
    // Then emit a navigation state instead of navigating directly
    // from the Cubit if that matches the existing project architecture.
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}