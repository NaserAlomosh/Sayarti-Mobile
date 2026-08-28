part of '../login_view.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final strings = S.of(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppTextField(
            controller: cubit.emailController,
            labelText: strings.email,
            hintText: strings.emailHint,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validationType: ValidationType.email,
            maxLength: 320,
            focusNode: cubit.emailNodeFoucse,
            validator: (value) => Validator.email(context, value),
            onChanged: (_) => cubit.checkCamSubmit(),
            onFieldSubmitted: (value) => cubit.onEmailSubmit(),
            borderType: AppTextFieldBorderType.outline,
            prefixIcon: const Icon(Icons.email_outlined, size: 22),
          ),
          const SizedBox(height: 16),
          CustomAppTextField(
            controller: cubit.passwordController,
            labelText: strings.password,
            hintText: strings.passwordHint,
            maxLength: 72,
            validator: (value) {
              if (value.isNullOrEmpty) {
                return S.of(context).passwordCannotBeEmpty;
              }
              return null;
            },
            onChanged: (_) => cubit.checkCamSubmit(),
            borderType: AppTextFieldBorderType.outline,
            prefixIcon: const Icon(Icons.lock_outline, size: 22),
            validationType: ValidationType.password,
            obscureTextOption: ObscureTextOption.toggleVisibility,
            focusNode: cubit.passwordNodeFoucse,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: null,
              child: Text(strings.forgotPassword),
            ),
          ),
          BlocSelector<LoginCubit, LoginState, bool>(
            selector: (state) {
              return state.canSubmit;
            },
            builder: (context, canSubmit) {
              return CustomAppButton(
                onPressed: canSubmit ? cubit.login : null,
                text: strings.continueText,
                isActive: canSubmit,
                width: double.infinity,
              );
            },
          ),
          const SizedBox(height: 24),

          /// OR
          const _OrDivider(),

          const SizedBox(height: 20),

          /// Google
          CustomOutlinedButton(
            text: 'Continue with Google',
            onPressed: () {
              // TODO: Google Login
            },
          ),

          const SizedBox(height: 28),

          /// Sign Up
          const _SignUpSection(),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.text,
    required this.isEnabled,
    required this.onPressed,
  });

  final String text;
  final bool isEnabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isEnabled
              ? const LinearGradient(
                  colors: [Color(0xFF009DB4), Color(0xFF00BDD5)],
                )
              : LinearGradient(
                  colors: [
                    Colors.grey.withValues(alpha: 0.35),
                    Colors.grey.withValues(alpha: 0.25),
                  ],
                ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(8),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isEnabled
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.45),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.22),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'or',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.22),
          ),
        ),
      ],
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton({required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white.withValues(alpha: 0.25)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 14),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Align(
            //   alignment: AlignmentDirectional.centerStart,
            //   child: SvgPicture.asset(
            //     AppImages.google,
            //     width: 22,
            //     height: 22,
            //   ),
            // ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignUpSection extends StatelessWidget {
  const _SignUpSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomHintText('New to Sayarti? '),
        CustomAppTextButton(
          text: 'Sign Up',
          color: Theme.of(context).colorScheme.primary,
          onTap: (){},
        ),
      ],
    );
  }
}
