part of '../login_view.dart';

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 40, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            child: SvgPicture.asset(AppImages.logoSvg, height: 72),
          ),
          const SizedBox(height: 40),
          CustomTitleText(strings.loginWelcome, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          CustomDescriptionText(
            strings.loginDescription,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          const _LoginForm(),
        ],
      ),
    );
  }
}
