import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/presentation/features/splash/cubit/splash_cubit.dart';

void main() {
  group('SplashCubit', () {
    test('starts with the default splash state', () async {
      final cubit = SplashCubit();
      addTearDown(cubit.close);

      expect(cubit.state, const SplashState());
    });

    test('does not emit additional states during initialization', () async {
      final cubit = SplashCubit();
      final emittedStates = <SplashState>[];
      final subscription = cubit.stream.listen(emittedStates.add);

      await cubit.close();
      await subscription.cancel();

      expect(emittedStates, isEmpty);
    });
  });
}
