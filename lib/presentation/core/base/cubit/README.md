BaseCubit

BaseCubit is a reusable base class for Flutter Cubits. It provides shared functionality for:

* Initialization
* Global loading dialog handling
* Keyboard focus dismissal
* Toast helpers
* Automatic loader dismissal when emitting states
* Timer management
* Safe cleanup when the Cubit is closed

Requirements

The implementation depends on:

dependencies:
  flutter_bloc: ^9.1.1

It also expects these project helpers:

FocusManagerHelper
LoadingManager

Basic Usage

Extend BaseCubit instead of extending Cubit directly:

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());
  Future<void> login() async {
    showLoading();
    final result = await repository.login();
    emit(
      LoginState.success(result),
    );
  }
}

Calling emit() automatically closes the loading dialog.

⸻

Initialization

Override init() when the Cubit needs to perform initial work:

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  @override
  Future<void> init() async {
    await getHomeData();
  }
}

Call it when creating the Cubit:

BlocProvider(
  create: (_) => HomeCubit()..init(),
  child: const HomeView(),
);

Avoid calling overridable initialization methods from the base constructor because child fields may not be initialized yet.

⸻

Loading Dialog

Show the global loading dialog:

showLoading();

By default, the keyboard is dismissed before showing the loader.

Keep the keyboard visible:

showLoading(
  dismissKeyboard: false,
);

Allow the loading dialog to be dismissed:

showLoading(
  barrierDismissible: true,
);

Hide the loader manually:

hideLoading();

Check whether the loader is currently visible:

if (isLoading) {
  // Loading dialog is visible.
}

The loading state is managed by LoadingManager.

⸻

Automatic Loader Dismissal

The overridden emit() method automatically hides the loading dialog before emitting a new state:

showLoading();
final result = await repository.getData();
emit(
  state.copyWith(data: result),
);

The loader is closed before the state is emitted.

Keep Loader Open

Use withoutCloseLoading: true when emitting an intermediate state:

showLoading();
emit(
  state.copyWith(isSubmitting: true),
  withoutCloseLoading: true,
);
final result = await repository.submit();
emit(
  state.copyWith(
    isSubmitting: false,
    result: result,
  ),
);

The first state keeps the loader visible. The final state closes it.

⸻

Toast Helpers

Show an error message:

showToastError(
  error: exception,
);

Use a custom message:

showToastError(
  title: 'Unable to complete the request',
);

Keep the loader open while showing the error:

showToastError(
  title: 'Validation failed',
  closeLoading: false,
);

Show a success message:

showToastSuccess();

Use a custom success message:

showToastSuccess(
  title: 'Profile updated successfully',
);

The actual toast implementation should be connected inside:

showToastError()
showToastSuccess()

Example:

AppToastMessage.showError(message);
AppToastMessage.showSuccess(message);

⸻

Timer

Start a timer:

startTimer(
  duration: const Duration(seconds: 30),
  onComplete: () {
    emit(state.copyWith(expired:true));
  },
);

Timer Tick

Execute a callback at a fixed interval:

startTimer(
  duration: const Duration(seconds: 30),
  tickInterval: const Duration(seconds: 1),
  onTick: () {
    // Called every second.
  },
  onComplete: () {
    // Called after 30 seconds.
  },
);

Before Timer Ends

Execute a callback before the timer completes:

startTimer(
  duration: const Duration(seconds: 30),
  beforeEndDuration: const Duration(seconds: 5),
  onBeforeEnd: () {
    // Called when 5 seconds remain.
  },
  onComplete: () {
    // Called when the timer finishes.
  },
);

Cancel Timer

cancelTimer();

Starting a new timer automatically cancels the previous timer.

⸻

Example

class OtpCubit extends BaseCubit<OtpState> {
  OtpCubit({
    required this.repository,
  }) : super(const OtpState.initial());
  final AuthRepository repository;
  @override
  Future<void> init() async {
    startOtpTimer();
  }
  Future<void> verifyOtp(String otp) async {
    showLoading();
    emit(
      state.copyWith(isSubmitting: true),
      withoutCloseLoading: true,
    );
    try {
      final response = await repository.verifyOtp(otp);
      emit(
        state.copyWith(
          isSubmitting: false,
          response: response,
        ),
      );
      showToastSuccess(
        title: 'OTP verified successfully',
        closeLoading: false,
      );
    } catch (error) {
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: error.toString(),
        ),
      );
      showToastError(
        error: error,
        closeLoading: false,
      );
    }
  }
  void startOtpTimer() {
    startTimer(
      duration: const Duration(minutes: 2),
      tickInterval: const Duration(seconds: 1),
      onTick: () {
        emit(
          state.copyWith(
            remainingSeconds: state.remainingSeconds - 1,
          ),
          withoutCloseLoading: true,
        );
      },
      onComplete: () {
        emit(
          state.copyWith(
            remainingSeconds: 0,
            isExpired: true,
          ),
        );
      },
    );
  }
}

⸻

Cleanup

When the Cubit is closed, BaseCubit automatically:

1. Cancels all active timers.
2. Hides the loading dialog.
3. Calls super.close().

@override
Future<void> close() async {
  cancelTimer();
  hideLoading();
  await super.close();
}

⸻

Notes

Global Loader

BaseCubit uses a global LoadingManager. This means all Cubits share the same loading dialog.

With the current boolean-based implementation, only one loading dialog is supported at a time.

If two asynchronous operations show the loader simultaneously, the first operation that calls hideLoading() may close it while the second operation is still running.

Emit Override

The custom withoutCloseLoading parameter is available only when the Cubit is typed as BaseCubit or as its concrete child class.

This works:

LoginCubit cubit = LoginCubit();
cubit.emit(
  state,
  withoutCloseLoading: true,
);

This custom parameter is not available when the instance is typed directly as Flutter Bloc’s Cubit<State>:

Cubit<LoginState> cubit = LoginCubit();

The original Cubit.emit() method does not define withoutCloseLoading.

Fire-and-Forget Loader

showLoading() uses:

unawaited(
  LoadingManager.show(),
);

unawaited() indicates that the returned Future is intentionally not awaited. The loading dialog remains open until hideLoading() is called.