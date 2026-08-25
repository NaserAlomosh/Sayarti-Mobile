import 'package:sayarti_mobile/presentation/core/widgets/language/cubit/languge_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageBuilder extends StatelessWidget {
  const LanguageBuilder({required this.builder, super.key});

  final Widget Function(
    BuildContext context,
    LanguageCubit cubit,
    LanguageState state,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      buildWhen: (previous, current) {
        return previous.language != current.language ||
            previous.locale != current.locale;
      },
      builder: (context, state) {
        return builder(context, context.read<LanguageCubit>(), state);
      },
    );
  }
}
