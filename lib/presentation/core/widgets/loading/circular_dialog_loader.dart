import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CircularDialogLoader extends StatelessWidget {
  const CircularDialogLoader({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Lottie.asset(
        AppImages.capitalLoaderAnimation,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        width: 66,
        height: 66,
      ),
    );
  }
}
