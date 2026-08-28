import 'package:flutter/services.dart';
import 'package:sayarti_mobile/presentation/core/base/cubit/base_cubit.dart';
import 'package:sayarti_mobile/presentation/core/helper/focus_manager/focus_manager_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BasePage<C extends BaseCubit<S>, S> extends StatelessWidget {
  const BasePage({super.key});

  C createCubit(BuildContext context) => GetIt.I<C>();

  Widget buildPage(BuildContext context, C cubit);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: createCubit,
      child: Builder(
        builder: (context) {
          return buildPage(context, context.read<C>());
        },
      ),
    );
  }
}

abstract class BaseView<C extends BaseCubit<S>, S> extends BasePage<C, S> {
  const BaseView({super.key});

  Widget buildContent(BuildContext context, C cubit);

  PreferredSizeWidget? buildAppBar(BuildContext context, C cubit) {
    return null;
  }

  Widget? buildFloatingActionButton(BuildContext context, C cubit) {
    return null;
  }

  Widget? buildBottomNavigationBar(BuildContext context, C cubit) {
    return null;
  }

  Widget? buildDrawer(BuildContext context, C cubit) {
    return null;
  }

  Widget? buildEndDrawer(BuildContext context, C cubit) {
    return null;
  }

  Widget? buildBottomSheet(BuildContext context, C cubit) {
    return null;
  }

  Color? buildBackgroundColor(BuildContext context, C cubit) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  bool get useScaffold => true;

  bool get useSafeArea => false;

  bool get dismissKeyboardOnTap => true;

  bool get extendBodyBehindAppBar => false;

  bool? get resizeToAvoidBottomInset => null;

  bool canPop(BuildContext context, C cubit) => true;

  void onPopInvoked(
    BuildContext context,
    C cubit,
    bool didPop,
    Object? result,
  ) {}

  void onOutsideTap(BuildContext context, C cubit) {}

  @override
  Widget buildPage(BuildContext context, C cubit) {
    setSystemUIOverlayStyle();

    Widget content = buildContent(context, cubit);

    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    if (useScaffold) {
      content = Scaffold(
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        appBar: buildAppBar(context, cubit),
        body: content,
        floatingActionButton: buildFloatingActionButton(context, cubit),
        bottomNavigationBar: buildBottomNavigationBar(context, cubit),
        drawer: buildDrawer(context, cubit),
        endDrawer: buildEndDrawer(context, cubit),
        bottomSheet: buildBottomSheet(context, cubit),
        backgroundColor: buildBackgroundColor(context, cubit),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      );
    }

    if (dismissKeyboardOnTap) {
      content = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManagerHelper.unfocus();
          onOutsideTap(context, cubit);
        },
        child: content,
      );
    }

    return PopScope<Object?>(
      canPop: canPop(context, cubit),
      onPopInvokedWithResult: (didPop, result) {
        onPopInvoked(context, cubit, didPop, result);
      },
      child: content,
    );
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        // Android: white status bar icons
        statusBarIconBrightness: Brightness.light,

        // iOS: white status bar icons
        statusBarBrightness: Brightness.dark,

        // Android bottom navigation icons
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
