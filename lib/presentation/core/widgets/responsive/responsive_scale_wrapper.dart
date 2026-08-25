import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

abstract final class ResponsiveScaleValues {
  // Android
  static const double androidMobilePortrait = 420;
  static const double androidMobileLandscape = 850;
  static const double androidTabletPortrait = 750;
  static const double androidTabletLandscape = 1000;

  // iOS
  static const double iosMobilePortrait = 440;
  static const double iosMobileLandscape = 780;
  static const double iosTabletPortrait = 700;
  static const double iosTabletLandscape = 900;
}

class AndroidResponsiveScaleWrapper extends StatelessWidget {
  const AndroidResponsiveScaleWrapper({
    required this.child,
    required this.orientation,
    super.key,
  });

  final Widget child;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isLandscape = orientation == Orientation.landscape;

    if (breakpoints.isDesktop) {
      return SizedBox.expand(
        child: child,
      );
    }

    final double baseWidth = _getBaseWidth(
      breakpoints: breakpoints,
      isLandscape: isLandscape,
    );

    return Center(
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(
          context,
          defaultValue: baseWidth,
          conditionalValues: [
            const Condition.smallerThan(
              name: MOBILE,
              value: 400,
            ),
            const Condition.equals(
              name: TABLET,
              value: ResponsiveScaleValues.androidTabletPortrait,
            ),
          ],
        ).value,
        child: child,
      ),
    );
  }

  double _getBaseWidth({
    required ResponsiveBreakpointsData breakpoints,
    required bool isLandscape,
  }) {
    if (breakpoints.isTablet) {
      return isLandscape
          ? ResponsiveScaleValues.androidTabletLandscape
          : ResponsiveScaleValues.androidTabletPortrait;
    }

    return isLandscape
        ? ResponsiveScaleValues.androidMobileLandscape
        : ResponsiveScaleValues.androidMobilePortrait;
  }
}

class IosResponsiveScaleWrapper extends StatelessWidget {
  const IosResponsiveScaleWrapper({
    required this.child,
    required this.orientation,
    super.key,
  });

  final Widget child;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isLandscape = orientation == Orientation.landscape;

    if (breakpoints.isDesktop) {
      return SizedBox.expand(
        child: child,
      );
    }

    final double baseWidth = _getBaseWidth(
      breakpoints: breakpoints,
      isLandscape: isLandscape,
    );

    return Center(
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(
          context,
          defaultValue: baseWidth,
          conditionalValues: [
            const Condition.smallerThan(
              name: MOBILE,
              value: 390,
            ),
            const Condition.equals(
              name: TABLET,
              value: ResponsiveScaleValues.iosTabletPortrait,
            ),
          ],
        ).value,
        child: child,
      ),
    );
  }

  double _getBaseWidth({
    required ResponsiveBreakpointsData breakpoints,
    required bool isLandscape,
  }) {
    if (breakpoints.isTablet) {
      return isLandscape
          ? ResponsiveScaleValues.iosTabletLandscape
          : ResponsiveScaleValues.iosTabletPortrait;
    }

    return isLandscape
        ? ResponsiveScaleValues.iosMobileLandscape
        : ResponsiveScaleValues.iosMobilePortrait;
  }
}


class ResponsiveScaleWrapper extends StatelessWidget {
  const ResponsiveScaleWrapper({
    required this.child,
    required this.orientation,
    super.key,
  });

  final Widget child;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return child;
    }

    if (Platform.isAndroid) {
      return AndroidResponsiveScaleWrapper(
        orientation: orientation,
        child: child,
      );
    }

    if (Platform.isIOS) {
      return IosResponsiveScaleWrapper(
        orientation: orientation,
        child: child,
      );
    }

    return child;
  }
}