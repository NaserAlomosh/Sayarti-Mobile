import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/service/local/onboarding/onboarding_storage.dart';
import 'package:sayarti_mobile/presentation/core/base/cubit/base_cubit.dart';

part 'splash_state.dart';
@injectable
class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit(this._onboardingStorage) : super(const SplashState());

  final OnboardingStorage _onboardingStorage;

  @override
  Future<void> init() async {
    final completed = await _onboardingStorage.isCompleted();
    emit(SplashState(showOnboarding: !completed), withoutCloseLoading: true);
  }
}
