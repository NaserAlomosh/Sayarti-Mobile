import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:sayarti_mobile/presentation/core/helper/extension/navigation_extensions.dart';
import 'package:sayarti_mobile/presentation/core/routing/routes.dart';
import 'package:sayarti_mobile/presentation/features/splash/cubit/splash_cubit.dart';

import '../../../core/base/view/base_view.dart';

part '../view/widgets/content.dart';
part '../view/widgets/loading.dart';

class SplashView extends BaseView<SplashCubit, SplashState> {
  const SplashView({super.key});

  @override
  Widget buildContent(BuildContext context, SplashCubit cubit) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (previous, current) {
        return previous.showOnboarding != current.showOnboarding;
      },
      listener: (context, state) {
        if (state.showOnboarding == true) {
          context.pushReplacementNamed(
            Routes.onboardingView,
          );
        } else if (state.showOnboarding == false) {
          context.pushReplacementNamed(
            Routes.loginView,
          );
        }
      },
      child: const _SplashContent(),
    );
  }

  @override
  Color? buildBackgroundColor(
    BuildContext context,
    SplashCubit cubit,
  ) {
    return AppColor.black;
  }
}