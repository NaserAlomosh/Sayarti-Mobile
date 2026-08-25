import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:sayarti_mobile/presentation/features/splash/cubit/splash_cubit.dart';

import '../../../core/base/view/base_view.dart';
part '../view/widgets/content.dart';
part '../view/widgets/loading.dart';

class SplashView extends BaseView<SplashCubit, SplashState> {
  const SplashView({super.key});

  static const backgroundImageKey = Key('splash_background_image');
  static const loadingTrackKey = Key('splash_loading_track');
  static const loadingProgressKey = Key('splash_loading_progress');

  @override
  Widget buildContent(BuildContext context, SplashCubit cubit) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: _SplashContent(),
    );
  }

  @override
  Color? buildBackgroundColor(BuildContext context, SplashCubit cubit) {
    return AppColor.black;
  }
}
