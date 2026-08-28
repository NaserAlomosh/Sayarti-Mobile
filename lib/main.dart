import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayarti_mobile/data/di/injection.dart';
import 'package:sayarti_mobile/presentation/core/theme/cubit/theme_cubit.dart';
import 'package:sayarti_mobile/presentation/core/widgets/language/cubit/languge_cubit.dart';
import 'package:sayarti_mobile/presentation/features/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => getIt<ThemeCubit>()),
        BlocProvider<LanguageCubit>(create: (_) => getIt<LanguageCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}
