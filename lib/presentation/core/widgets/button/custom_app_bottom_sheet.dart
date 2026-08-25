import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:sayarti_mobile/presentation/core/widgets/button/custom_app_button.dart';
import 'package:flutter/material.dart';

class CustomAppBottomSheet extends StatelessWidget {
  const CustomAppBottomSheet({
    required this.onClickNext,
    super.key,
    this.totalSteps,
    this.currentStep,
    this.leading,
    this.width,
    this.buttonColor,
    this.label = '',
    this.containerColor,
    this.isActive = true,
    this.showNextButton = true,
    this.padding,
  });

  final VoidCallback onClickNext;

  final int? totalSteps;
  final int? currentStep;

  final double? width;
  final String label;
  final Widget? leading;

  final bool isActive;
  final Color? containerColor;
  final Color? buttonColor;
  final bool showNextButton;
  final EdgeInsetsGeometry? padding;

  int? get _progress {
    if (totalSteps == null || currentStep == null) {
      return null;
    }

    if (totalSteps! <= 0) {
      return null;
    }

    return ((currentStep! / totalSteps!) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return SafeArea(
      top: false,
      child: Padding(
        padding: padding ?? const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearFormFillProgressIndicator(progress: _progress),
            Container(
              padding: const EdgeInsets.only(top: 24),
              color: containerColor ?? Theme.of(context).bottomAppBarTheme.color,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    showNextButton
                        ? CustomAppButton(
                            backgroundColor: buttonColor,
                            text: label.isNotEmpty ? label : localization.next,
                            onPressed: onClickNext,
                            width: width ?? 124,
                            height: 48,
                            isActive: isActive,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinearFormFillProgressIndicator extends StatelessWidget {
  const LinearFormFillProgressIndicator({super.key, this.progress});

  /// Value from 0 to 100

  final int? progress;

  @override
  Widget build(BuildContext context) {
    final percentage = ((progress ?? 0).clamp(0, 100)) / 100;

    return SizedBox(
      height: 4,

      child: Stack(
        fit: StackFit.expand,

        children: [
          Container(color: AppColor.lightGrey),

          Align(
            alignment: AlignmentDirectional.centerStart,

            child: AnimatedFractionallySizedBox(
              duration: const Duration(milliseconds: 500),

              curve: Curves.easeInOut,

              widthFactor: percentage,

              alignment: AlignmentDirectional.centerStart,

              child: Container(color: AppColor.blue),
            ),
          ),
        ],
      ),
    );
  }
}
