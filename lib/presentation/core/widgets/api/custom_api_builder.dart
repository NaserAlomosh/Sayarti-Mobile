import 'dart:ui';

import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/widgets/loading/circular_dialog_loader.dart';
import 'package:flutter/material.dart';

class CustomApiBuilder extends StatelessWidget {
  const CustomApiBuilder({
    required this.onSuccessBuilder,
    super.key,
    this.isLoading = false,
    this.isEmpty = false,
    this.apiErrorModel,
    this.onErrorBuilder,
    this.onLoadingBuilder,
    this.onEmptyBuilder,
    this.emptyMessage = 'No data found',
    this.duration = const Duration(milliseconds: 700),
    this.switchInCurve = Curves.easeOutCubic,
    this.switchOutCurve = Curves.easeInCubic,
    this.transitionBuilder,
  });

  final Widget Function(BuildContext context) onSuccessBuilder;

  final Widget Function(
    BuildContext context,
    ApiErrorModel error,
  )?
  onErrorBuilder;

  final Widget Function(BuildContext context)? onLoadingBuilder;

  final Widget Function(BuildContext context)? onEmptyBuilder;

  final Widget Function(
    Widget child,
    Animation<double> animation,
  )?
  transitionBuilder;

  final ApiErrorModel? apiErrorModel;

  final bool isLoading;
  final bool isEmpty;

  final String emptyMessage;

  final Duration duration;

  final Curve switchInCurve;
  final Curve switchOutCurve;

@override
Widget build(BuildContext context) {
  Widget child;

  if (isLoading) {
    child = KeyedSubtree(
      key: const ValueKey('loading'),
      child:
          onLoadingBuilder?.call(context) ??
          const Center(
            child: CircularDialogLoader(),
          ),
    );
  } else if (apiErrorModel != null) {
    child = KeyedSubtree(
      key: const ValueKey('error'),
      child:
          onErrorBuilder?.call(
            context,
            apiErrorModel!,
          ) ??
          Center(
            child: Text(
              apiErrorModel?.message ??
                  S.of(context).somethingWentWrong,
            ),
          ),
    );
  } else if (isEmpty) {
    child = KeyedSubtree(
      key: const ValueKey('empty'),
      child:
          onEmptyBuilder?.call(context) ??
          Center(
            child: Text(emptyMessage),
          ),
    );
  } else {
    child = KeyedSubtree(
      key: const ValueKey('success'),
      child: onSuccessBuilder(context),
    );
  }

  return LayoutBuilder(
    builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: AnimatedSwitcher(
          duration: duration,
          switchInCurve: switchInCurve,
          switchOutCurve: switchOutCurve,

          layoutBuilder: (
            currentChild,
            previousChildren,
          ) {
            return Stack(
              fit: StackFit.expand,
              children: [
                for (final previousChild in previousChildren)
                  Positioned.fill(
                    child: previousChild,
                  ),

                if (currentChild != null)
                  Positioned.fill(
                    child: currentChild,
                  ),
              ],
            );
          },

          transitionBuilder:
              transitionBuilder ??
              (child, animation) {
                final curved = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                  reverseCurve: Curves.easeInCubic,
                );

                final fade = Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: const Interval(
                      0.18,
                      0.82,
                      curve: Curves.easeOut,
                    ),
                  ),
                );

                final slide = Tween<Offset>(
                  begin: const Offset(
                    0,
                    0.035,
                  ),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutQuart,
                  ),
                );

                final scale = Tween<double>(
                  begin: 0.975,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutExpo,
                  ),
                );

                final blur = Tween<double>(
                  begin: 6,
                  end: 0,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: const Interval(
                      0,
                      0.55,
                      curve: Curves.easeOut,
                    ),
                  ),
                );

                return AnimatedBuilder(
                  animation: curved,
                  child: child,
                  builder: (
                    context,
                    animatedChild,
                  ) {
                    return Opacity(
                      opacity: fade.value,
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          slide.value.dy * 100,
                        ),
                        child: Transform.scale(
                          scale: scale.value,
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: blur.value,
                              sigmaY: blur.value,
                            ),
                            child: animatedChild,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },

          child: child,
        ),
      );
    },
  );
}}