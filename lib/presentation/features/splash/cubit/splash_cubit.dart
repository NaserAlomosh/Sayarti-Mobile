import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/service/local/onboarding/onboarding_storage.dart';
import 'package:sayarti_mobile/presentation/core/base/cubit/base_cubit.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit(
    this._onboardingStorage,
  ) : super(const SplashState());

  final OnboardingStorage _onboardingStorage;

  Future<void> initSplash() async {
    final isOnboardingCompleted =
        await _onboardingStorage.isCompleted();

    emit(
      state.copyWith(
        showOnboarding: !isOnboardingCompleted,
      ),
      withoutCloseLoading: true,
    );
  }
}