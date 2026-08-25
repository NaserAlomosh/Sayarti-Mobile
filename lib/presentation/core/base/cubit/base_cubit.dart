import 'dart:async';

import 'package:sayarti_mobile/data/networking/error/app_error.dart';
import 'package:sayarti_mobile/presentation/core/helper/focus_manager/focus_manager_helper.dart';
import 'package:sayarti_mobile/presentation/core/widgets/loading/app_loading.dart';
import 'package:sayarti_mobile/presentation/core/widgets/toast/app_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState) {
    unawaited(init());
  }

  Timer? _periodicTimer;
  Timer? _beforeEndTimer;
  Timer? _completionTimer;

  bool get isLoading => LoadingManager.isShowing;

  Future<void> init() async {}

  void showLoading({
    bool dismissKeyboard = true,
    bool barrierDismissible = false,
  }) {
    if (LoadingManager.isShowing) return;

    if (dismissKeyboard) {
      FocusManagerHelper.unfocus();
    }

    unawaited(LoadingManager.show(barrierDismissible: barrierDismissible));
  }

  void hideLoading() {
    LoadingManager.hide();
  }

  void showToastError({
    ApiErrorModel? error,
    String? title,
    bool closeLoading = true,
  }) {
    if (closeLoading) {
      hideLoading();
    }

    final message = title ?? error?.message;

    unawaited(AppToast.error(description: message ?? ''));
  }

  void showToastSuccess({String? title, bool closeLoading = true}) {
    if (closeLoading) {
      hideLoading();
    }

    unawaited(AppToast.success(description: title ?? ''));
  }

  @override
  void emit(S state, {bool withoutCloseLoading = false}) {
    if (isClosed) return;

    if (!withoutCloseLoading) {
      hideLoading();
    }

    super.emit(state);
  }

  void startTimer({
    required Duration duration,
    VoidCallback? onComplete,
    VoidCallback? onTick,
    Duration tickInterval = const Duration(seconds: 1),
    Duration? beforeEndDuration,
    VoidCallback? onBeforeEnd,
  }) {
    assert(
      duration > Duration.zero,
      'Timer duration must be greater than zero.',
    );

    assert(
      tickInterval > Duration.zero,
      'Tick interval must be greater than zero.',
    );

    assert(
      beforeEndDuration == null ||
          (beforeEndDuration >= Duration.zero && beforeEndDuration <= duration),
      'beforeEndDuration must be between zero and the timer duration.',
    );

    cancelTimer();

    if (onTick != null) {
      _periodicTimer = Timer.periodic(tickInterval, (_) => onTick());
    }

    if (beforeEndDuration != null && onBeforeEnd != null) {
      _beforeEndTimer = Timer(duration - beforeEndDuration, onBeforeEnd);
    }

    _completionTimer = Timer(duration, () {
      _periodicTimer?.cancel();
      _beforeEndTimer?.cancel();

      _periodicTimer = null;
      _beforeEndTimer = null;
      _completionTimer = null;

      onComplete?.call();
    });
  }

  void cancelTimer() {
    _periodicTimer?.cancel();
    _beforeEndTimer?.cancel();
    _completionTimer?.cancel();

    _periodicTimer = null;
    _beforeEndTimer = null;
    _completionTimer = null;
  }

  @override
  Future<void> close() async {
    cancelTimer();
    hideLoading();

    await super.close();
  }
}
