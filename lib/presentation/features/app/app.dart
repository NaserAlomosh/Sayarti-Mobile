import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/helper/navigator_key/app_key.dart';
import 'package:sayarti_mobile/presentation/core/routing/app_router.dart';
import 'package:sayarti_mobile/presentation/core/routing/routes.dart';
import 'package:sayarti_mobile/presentation/core/theme/cubit/theme_cubit.dart';
import 'package:sayarti_mobile/presentation/core/widgets/language/view/language_builder.dart';
import 'package:sayarti_mobile/presentation/core/widgets/responsive/responsive_scale_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) => previous.themeType != current.themeType,
      builder: (context, themeState) {
        return LanguageBuilder(
          builder: (context, languageCubit, languageState) {
            return MaterialApp(
              navigatorKey: AppKey.navigator,
              debugShowCheckedModeBanner: false,
              theme: themeState.themeData,
              themeAnimationCurve: Curves.easeInOut,
              locale: languageState.locale,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: Routes.splashView,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder: (context, widget) {
                return OrientationBuilder(
                  builder: (context, orientation) {
                    return ResponsiveBreakpoints.builder(
                      child: ResponsiveScaleWrapper(
                        orientation: orientation,
                        child: widget!,
                      ),
                      breakpoints: const [
                        Breakpoint(start: 0, end: 450, name: MOBILE),
                        Breakpoint(start: 451, end: 800, name: TABLET),
                        Breakpoint(start: 801, end: 1920, name: DESKTOP),
                        Breakpoint(
                          start: 1921,
                          end: double.infinity,
                          name: '4K',
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
