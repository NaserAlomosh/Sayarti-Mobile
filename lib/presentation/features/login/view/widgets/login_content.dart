part of '../login_view.dart';

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Stack(
      children: [
        /// Background image
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: screenHeight * 0.55,
          child: Image.asset(
            AppImages.loginBackground,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),

        /// This Column defines the actual height of the whole screen.
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Space occupied by the image.
            SizedBox(
              height: screenHeight * 0.30,
            ),

            /// Login content + gradient transition.
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    backgroundColor.withValues(alpha: 0.0),
                    backgroundColor.withValues(alpha: 0.7),
                    backgroundColor,
                    backgroundColor,
                  ],
                  stops: const [
                    0.0,
                    0.12,
                    0.25,
                    1.0,
                  ],
                ),
              ),
              padding: const EdgeInsetsDirectional.fromSTEB(
                20,
                70,
                20,
                24,
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleText(
                      strings.loginWelcome,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 8),
                    CustomDescriptionText(
                      strings.loginDescription,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 28),
                    const _LoginForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}