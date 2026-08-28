// ignore_for_file: strict_top_level_inference

// import 'package:valet_tech/core/routing/app_router.dart';
// import 'package:valet_tech/core/widgets/text/title/custom_title_text.dart';
import 'package:flutter/material.dart';
import 'package:sayarti_mobile/presentation/core/routing/app_router.dart';

extension Navigation on BuildContext {
  Future<dynamic> push(
    Widget screen, {
    required String routeName,
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator).push(
      MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  Future<dynamic> pushReplacement(
    Widget screen, {
    required String routeName,
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  Future<dynamic> pushWithBottomToTop(
    Widget screen, {
    bool rootNavigator = false,
  }) {
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).push(_bottomToTopPageScreen(screen));
  }

  // Future<dynamic> pushNamed(String routeName, {Object? arguments, bool rootNavigator = false}) {
  //   return Navigator.of(
  //     this,
  //     rootNavigator: rootNavigator,
  //   ).pushNamed(routeName, arguments: arguments);
  // }

  Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntilNamed(
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> pushWithZoom(String routeName, {Object? arguments}) {
    return Navigator.of(this).push(_zoomPageRoute(routeName, arguments));
  }

  Future<dynamic> pushAndRemoveUntilWithZoom(
    String routeName, {
    Object? arguments,
    rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator).pushAndRemoveUntil(
      _zoomPageRoute(routeName, arguments),
      (route) => false,
    );
  }

  Future<dynamic> pushReplacementWithZoom(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushReplacement(_zoomPageRoute(routeName, arguments));
  }

  Future<dynamic> pushWithLeftToRight(String routeName, {Object? arguments}) {
    return Navigator.of(this).push(_leftToRightPageRoute(routeName, arguments));
  }

  Future<dynamic> pushReplacementWithLeftToRight(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushReplacement(_leftToRightPageRoute(routeName, arguments));
  }

  Future<dynamic> pushWithRightToLeft(String routeName, {Object? arguments}) {
    return Navigator.of(this).push(_rightToLeftPageRoute(routeName, arguments));
  }

  Future<dynamic> pushReplacementWithRightToLeft(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushReplacement(_rightToLeftPageRoute(routeName, arguments));
  }

  Future<dynamic> pushWithTopToBottom(String routeName, {Object? arguments}) {
    return Navigator.of(this).push(_topToBottomPageRoute(routeName, arguments));
  }

  Future<dynamic> pushReplacementWithTopToBottom(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushReplacement(_topToBottomPageRoute(routeName, arguments));
  }

  Future<dynamic> pushNamedWithBottomToTop(
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).push(_bottomToTopPageRoute(routeName, arguments));
  }

  Future<dynamic> pushReplacementWithBottomToTop(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushReplacement(_bottomToTopPageRoute(routeName, arguments));
  }

  void pop({result, rootNavigator = false}) {
    Navigator.of(this, rootNavigator: rootNavigator).pop(result);
  }

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }
}

// Transition Helpers
PageRouteBuilder _zoomPageRoute(String routeName, Object? arguments) {
  return PageRouteBuilder(
    settings: RouteSettings(name: routeName, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) =>
        _getRouteWidget(routeName, arguments),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(scale: animation, child: child);
    },
  );
}

PageRouteBuilder _leftToRightPageRoute(String routeName, Object? arguments) {
  return PageRouteBuilder(
    settings: RouteSettings(name: routeName, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) =>
        _getRouteWidget(routeName, arguments),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

PageRouteBuilder _rightToLeftPageRoute(String routeName, Object? arguments) {
  return PageRouteBuilder(
    settings: RouteSettings(name: routeName, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) =>
        _getRouteWidget(routeName, arguments),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

PageRouteBuilder _topToBottomPageRoute(String routeName, Object? arguments) {
  return PageRouteBuilder(
    settings: RouteSettings(name: routeName, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) =>
        _getRouteWidget(routeName, arguments),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

PageRouteBuilder _bottomToTopPageRoute(String routeName, Object? arguments) {
  return PageRouteBuilder(
    settings: RouteSettings(name: routeName, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) =>
        _getRouteWidget(routeName, arguments),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

PageRouteBuilder _bottomToTopPageScreen(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

// Retrieves the correct screen based on the registered routes

Widget _getRouteWidget(String routeName, Object? arguments) {
  final route = AppRouter.generateRoute(
    RouteSettings(name: routeName, arguments: arguments),
  );

  if (route is MaterialPageRoute) {
    return route.builder(route.navigator?.context ?? BuildContextPlaceholder());
  }

  return const Scaffold(
    body: Center(
      child: Text(
        'Something went wrong,\nplease contact support',
        textAlign: TextAlign.center,
      ),
    ),
  );
}

//Dummy context to prevent errors
class BuildContextPlaceholder extends BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;

  bool isNotNullOrEmpty() => this != null || this!.isNotEmpty;
}
