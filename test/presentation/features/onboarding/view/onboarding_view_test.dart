import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/data/service/local/onboarding/onboarding_storage.dart';
import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/theme/default_app_theme.dart';
import 'package:sayarti_mobile/presentation/features/onboarding/view/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences preferences;
  late OnboardingStorage storage;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    preferences = await SharedPreferences.getInstance();
    storage = OnboardingStorage(Future.value(preferences));
  });

  Widget subject({Locale locale = const Locale('en'), VoidCallback? complete}) {
    return MaterialApp(
      theme: const DefaultAppTheme().themeData,
      locale: locale,
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: OnboardingView(storage: storage, onCompleted: complete),
    );
  }

  List<double> indicatorWidths(WidgetTester tester) => tester
      .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
      .where((widget) => widget.height == 8)
      .map((widget) => widget.width!)
      .toList();

  testWidgets('renders the localized first onboarding page and indicator', (
    tester,
  ) async {
    await tester.pumpWidget(subject());
    await tester.pumpAndSettle();

    expect(find.text('YOUR CAR, SIMPLIFIED'), findsOneWidget);
    expect(
      find.text('Everything your car needs, in one place'),
      findsOneWidget,
    );
    expect(find.text('Next'), findsOneWidget);
    expect(indicatorWidths(tester), [24, 8, 8]);
  });

  testWidgets('next actions visit every page and final action completes', (
    tester,
  ) async {
    var completed = false;
    await tester.pumpWidget(subject(complete: () => completed = true));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Never miss what matters'), findsOneWidget);
    expect(indicatorWidths(tester), [8, 24, 8]);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Smarter insights for every journey'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
    expect(indicatorWidths(tester), [8, 8, 24]);

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();
    expect(completed, isTrue);
    expect(await storage.isCompleted(), isTrue);
  });

  testWidgets('swiping updates the selected page', (tester) async {
    await tester.pumpWidget(subject());
    await tester.pumpAndSettle();

    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();

    expect(find.text('Never miss what matters'), findsOneWidget);
    expect(indicatorWidths(tester), [8, 24, 8]);
  });

  testWidgets('skip persists completion and invokes navigation callback', (
    tester,
  ) async {
    var completed = false;
    await tester.pumpWidget(subject(complete: () => completed = true));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    expect(completed, isTrue);
    expect(preferences.getBool('onboarding_completed'), isTrue);
  });

  testWidgets('Arabic copy renders in an RTL layout', (tester) async {
    await tester.pumpWidget(subject(locale: const Locale('ar')));
    await tester.pumpAndSettle();

    expect(find.text('تخطي'), findsOneWidget);
    expect(find.text('كل ما تحتاجه سيارتك في مكان واحد'), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.byType(OnboardingView))),
      TextDirection.rtl,
    );
  });
}
