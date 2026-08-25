part of '../login_view.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final strings = S.of(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          CustomAppTextField(
            key: const Key('login_email'),
            controller: cubit.emailController,
            labelText: strings.email,
            hintText: strings.emailHint,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            maxLength: 320,
            validator: (value) => cubit.validateEmail(
              value,
              requiredMessage: strings.emailRequired,
              invalidMessage: strings.emailInvalid,
            ),
            onChanged: (_) => cubit.onFormChanged(),
            borderType: AppTextFieldBorderType.outline,
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          const SizedBox(height: 16),
          CustomAppTextField(
            key: const Key('login_password'),
            controller: cubit.passwordController,
            labelText: strings.password,
            hintText: strings.passwordHint,
            obscureText: state.obscurePassword,
            maxLength: 72,
            validator: (value) => cubit.validatePassword(
              value,
              requiredMessage: strings.passwordRequired,
            ),
            onChanged: (_) => cubit.onFormChanged(),
            borderType: AppTextFieldBorderType.outline,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              key: const Key('toggle_password_visibility'),
              onPressed: cubit.togglePasswordVisibility,
              icon: Icon(
                state.obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              ),
            ),
            onFieldSubmitted: (_) => cubit.login(),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(onPressed: null, child: Text(strings.forgotPassword)),
          ),
          CustomAppButton(
            onPressed: state.canSubmit ? cubit.login : null,
            text: strings.continueText,
            isActive: state.canSubmit,
            width: double.infinity,
          ),
          ],
        ),
      ),
    );
  }
}
