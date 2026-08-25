import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/presentation/core/routing/app_router.dart';
import 'package:sayarti_mobile/presentation/core/routing/routes.dart';
import 'package:sayarti_mobile/presentation/features/splash/view/splash_view.dart';

void main() {
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
