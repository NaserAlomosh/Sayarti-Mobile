import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:flutter/material.dart';

class CustomResendCodeButton extends StatelessWidget {
  const CustomResendCodeButton({
    required this.remainingSeconds,
    required this.canResend,
    required this.onResend,
    super.key,
    this.textColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
  });

  final int remainingSeconds;
  final bool canResend;
  final VoidCallback onResend;

  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    final color = textColor ?? AppColor.blue;

    final textStyle = TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );

    if (canResend) {
      return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: onResend,
        child: Text(
          S.of(context).resendCode,
          style: textStyle,
        ),
      );
    }

    return Text(
      '${S.of(context).resendCode} '
      '${S.of(context).iN} '
      '${_formatTime(remainingSeconds)}',
      style: textStyle,
    );
  }

  String _formatTime(int totalSeconds) {
    final safeSeconds = totalSeconds < 0 ? 0 : totalSeconds;

    final minutes = safeSeconds ~/ 60;
    final seconds = safeSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }
}