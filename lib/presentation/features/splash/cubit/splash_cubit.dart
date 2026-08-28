import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/presentation/core/base/cubit/base_cubit.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> initSplash() async {
    emit(state.copyWith(showOnboarding: false));
  }
}
