import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/base/view/base_view.dart';
import 'package:sayarti_mobile/presentation/core/constants/images/app_images.dart';
import 'package:sayarti_mobile/presentation/core/widgets/button/custom_app_button.dart';
import 'package:sayarti_mobile/presentation/core/widgets/text/custom_text.dart';
import 'package:sayarti_mobile/presentation/core/widgets/textfield/custom_app_textfield.dart';
import 'package:sayarti_mobile/presentation/features/login/cubit/login_cubit.dart';

part 'widgets/login_content.dart';
part 'widgets/login_form.dart';

class LoginView extends BaseView<LoginCubit, LoginState> {
  const LoginView({super.key});

  @override
  bool get useSafeArea => true;

  @override
  Widget buildContent(BuildContext context, LoginCubit cubit) =>
      const _LoginContent();
}
