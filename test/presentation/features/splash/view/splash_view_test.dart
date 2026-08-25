import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:sayarti_mobile/presentation/features/splash/cubit/splash_cubit.dart';
import 'package:sayarti_mobile/presentation/features/splash/view/splash_view.dart';

void main() {
  setUp(() {
    GetIt.I.registerFactory<SplashCubit>(SplashCubit.new);
  });

  tearDown(() async {
    await GetIt.I.reset();
  });

  Widget subject() => const MaterialApp(home: SplashView());

  testWidgets('renders the splash background and loading indicator', (
    tester,
  ) async {
    await tester.pumpWidget(subject());

    expect(find.byType(SplashView), findsOneWidget);

    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, AppColor.black);

    final background = tester.widget<Image>(
      find.byKey(SplashView.backgroundImageKey),
    );
    expect(background.image, isA<AssetImage>());
    expect((background.image as AssetImage).assetName, AppImages.splashPng);
    expect(background.fit, BoxFit.cover);
    expect(background.alignment, Alignment.center);

    expect(find.byKey(SplashView.loadingTrackKey), findsOneWidget);
    expect(find.byKey(SplashView.loadingProgressKey), findsOneWidget);
    expect(tester.getSize(find.byType(ClipRRect)), const Size(140, 3));
  });

  testWidgets('uses light system icons over transparent system bars', (
    tester,
  ) async {
    await tester.pumpWidget(subject());

    final region = tester.widget<AnnotatedRegion<SystemUiOverlayStyle>>(
      find.byType(AnnotatedRegion<SystemUiOverlayStyle>),
    );

    expect(region.value.statusBarColor, Colors.transparent);
    expect(region.value.systemNavigationBarColor, Colors.transparent);
    expect(region.value.statusBarIconBrightness, Brightness.light);
    expect(region.value.systemNavigationBarIconBrightness, Brightness.light);
  });

  testWidgets('animates the loading progress from empty to full width', (
    tester,
  ) async {
    await tester.pumpWidget(subject());

    double progressWidth() =>
        tester.getSize(find.byKey(SplashView.loadingProgressKey)).width;

    expect(progressWidth(), 0);

    await tester.pump(const Duration(seconds: 1));
    expect(progressWidth(), closeTo(70, 0.01));

    await tester.pump(const Duration(seconds: 1));
    expect(progressWidth(), closeTo(140, 0.01));
  });

  testWidgets('fills compact and tall screens without overflowing', (
    tester,
  ) async {
    for (final size in [const Size(320, 568), const Size(430, 932)]) {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(subject());

      expect(tester.getSize(find.byType(Scaffold)), size);
      expect(tester.takeException(), isNull);
    }

    await tester.binding.setSurfaceSize(null);
  });
}
