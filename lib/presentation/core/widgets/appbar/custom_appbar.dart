import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.showCloseButton = true,
    this.onBackPressed,
    this.onClosePressed,
    this.backIcon,
    this.closeIcon,
    this.backIconColor,
    this.closeIconColor,
    this.backgroundColor,
    this.elevation = 0,
    this.centerTitle = true,
    this.rightPaddingCloseButton = 5,
    this.statusBarBrightness,
    this.preferredHeight = kToolbarHeight,
  });

  final Widget? title;

  final bool showBackButton;
  final bool showCloseButton;

  final VoidCallback? onBackPressed;
  final VoidCallback? onClosePressed;

  final Widget? backIcon;
  final Widget? closeIcon;

  final Color? backIconColor;
  final Color? closeIconColor;
  final Color? backgroundColor;

  final double elevation;
  final bool centerTitle;
  final double rightPaddingCloseButton;

  final Brightness? statusBarBrightness;

  final double preferredHeight;

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor =
        backgroundColor ??
        appBarTheme.backgroundColor ??
        theme.scaffoldBackgroundColor;

    final effectiveForegroundColor =
        appBarTheme.foregroundColor ?? colorScheme.primary;

    final effectiveBackIconColor = backIconColor ?? effectiveForegroundColor;

    final effectiveCloseIconColor = closeIconColor ?? effectiveForegroundColor;

    return AppBar(
      elevation: elevation,

      centerTitle: centerTitle,

      backgroundColor: effectiveBackgroundColor,

      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      automaticallyImplyLeading: false,
      // leading: showBackButton
      //     ? IconButton(
      //         splashColor: Colors.transparent,
      //         highlightColor: Colors.transparent,
      //         hoverColor: Colors.transparent,
      //         onPressed:
      //             onBackPressed ??
      //             () async {
      //               await Navigator.of(context).maybePop();
      //             },
      //         icon: Icon(Icons..b)
      //         //     backIcon ??
      //         //     SvgPicture.asset(
      //         //       AppImages.arrowBack,
      //         //       matchTextDirection: true,
      //         //       colorFilter: ColorFilter.mode(
      //         //         effectiveBackIconColor,
      //         //         BlendMode.srcIn,
      //         //       ),
      //         //     ),
      //       )
      //     : const SizedBox.shrink(),
      title: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: title ?? const SizedBox.shrink(),
      ),
      actions: [
        if (showCloseButton)
          Padding(
            padding: EdgeInsetsDirectional.only(end: rightPaddingCloseButton),
            child: closeIcon != null
                ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: onClosePressed ?? () async {
                      await Navigator.of(context).maybePop();
                    },
                    icon: closeIcon!,
                  )
                : IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: onClosePressed ?? () async {
                      await Navigator.of(context).maybePop();
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      size: 24,
                      color: effectiveCloseIconColor,
                    ),
                  ),
          ),
      ],
    );
  }
}
