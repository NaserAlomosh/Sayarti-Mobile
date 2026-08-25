import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sayarti_mobile/presentation/core/routing/app_router.dart';
import 'package:sayarti_mobile/presentation/core/routing/routes.dart';
import 'package:sayarti_mobile/presentation/features/splash/cubit/splash_cubit.dart';
import 'package:sayarti_mobile/presentation/features/splash/view/splash_view.dart';

void main() {
  setUp(() {
    GetIt.I.registerFactory<SplashCubit>(SplashCubit.new);
  });

  tearDown(() async {
    await GetIt.I.reset();
  });

  testWidgets('splash route builds SplashView', (tester) async {
    await tester.pumpWidget(
      CupertinoApp(
        initialRoute: Routes.splashView,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );

    expect(find.byType(SplashView), findsOneWidget);
  });
}
