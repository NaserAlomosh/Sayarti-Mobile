// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
// import 'package:sayarti_mobile/presentation/core/theme/default_app_theme.dart';
// import 'package:sayarti_mobile/presentation/features/splash/presentation/view/splash_view.dart';

// void main() {
//   Widget subject() => MaterialApp(
//     theme: const DefaultAppTheme().themeData,
//     home: const SplashView(),
//   );

//   testWidgets('renders the complete splash branding', (tester) async {
//     await tester.pumpWidget(subject());

//     expect(find.byType(SplashView), findsOneWidget);
//     expect(find.byKey(const Key('splash_background')), findsOneWidget);
 

//     final logo = tester.widget<SvgPicture>(find.byKey(SplashView.logoKey));
//     expect(logo.bytesLoader, isA<SvgAssetLoader>());
//     expect((logo.bytesLoader as SvgAssetLoader).assetName, AppImages.capitalBank);
//     expect(logo.width, 222);
//     expect(logo.height, 54);
//   });

//   testWidgets('centers the logo and fills compact and tall screens', (
//     tester,
//   ) async {
//     for (final size in [const Size(320, 568), const Size(430, 932)]) {
//       await tester.binding.setSurfaceSize(size);
//       await tester.pumpWidget(subject());

//       expect(tester.getSize(find.byType(Scaffold)), size);
//       expect(
//         Offset(size.width / 2, size.height / 2),
//       );
//     }

//     await tester.binding.setSurfaceSize(null);
//   });
// }
