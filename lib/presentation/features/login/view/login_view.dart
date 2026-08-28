import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/base/view/base_view.dart';
import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:sayarti_mobile/presentation/core/helper/extension/string_extension.dart';
import 'package:sayarti_mobile/presentation/core/helper/validation/validator.dart';
import 'package:sayarti_mobile/presentation/core/widgets/button/custom_app_button.dart';
import 'package:sayarti_mobile/presentation/core/widgets/button/custom_app_text_button.dart';
import 'package:sayarti_mobile/presentation/core/widgets/button/custom_outline_button.dart';
import 'package:sayarti_mobile/presentation/core/widgets/text/custom_text.dart';
import 'package:sayarti_mobile/presentation/core/widgets/textfield/custom_app_textfield.dart';
import 'package:sayarti_mobile/presentation/features/login/cubit/login_cubit.dart';

part 'widgets/login_content.dart';
part 'widgets/login_form.dart';

class LoginView extends BaseView<LoginCubit, LoginState> {
  const LoginView({super.key});

  @override
  Widget buildContent(BuildContext context, LoginCubit cubit) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.loginSuccess != current.loginSuccess,
      listener: (context, state) {
        if (state.loginSuccess) {
          // Add Push To Dashboard
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: const _LoginContent(),
            ),
          );
        },
      ),
    );
  }
}
