# Base Layers

This document explains the shared base components used across the application architecture.

The purpose of these base layers is to:

- reduce duplicated code
- keep feature behavior consistent
- centralize error handling
- standardize remote and local operations
- preserve separation between Data, Domain, and Presentation layers
- simplify feature Cubits and repositories
- enforce a consistent feature structure
- keep Views small and readable

---

## BaseView

`BaseView<Cubit, State>` provides the common structure used by application screens.

Typical responsibilities include:

- resolving the feature Cubit
- initializing the Cubit lifecycle
- building screen content
- exposing optional AppBar configuration
- exposing optional bottom sheet configuration
- handling shared page-level behavior
- keeping screen structure consistent across features

Example:

```dart
class LoginView extends BaseView<LoginCubit, LoginState> {
  const LoginView({super.key});

  @override
  Widget buildContent(
    BuildContext context,
    LoginCubit cubit,
  ) {
    return const _LoginContent();
  }
}
```

Optional AppBar:

```dart
@override
PreferredSizeWidget? buildAppBar(
  BuildContext context,
  LoginCubit cubit,
) {
  return const CustomAppBar();
}
```

Optional Bottom Sheet:

```dart
@override
Widget? buildBottomSheet(
  BuildContext context,
  LoginCubit cubit,
) {
  return null;
}
```

`BaseView` should contain page composition only.

Large or reusable UI sections should not be implemented directly inside the View file.

---

## View Widget Structure

Feature-specific widgets must be placed inside:

```text
view/widgets/
```

For example:

```text
login/
    └── view/
        ├── login_view.dart
        └── widgets/
            ├── login_content.dart
            ├── login_form.dart
            └── login_submit_button.dart
```

Widgets that belong only to that View should be private.

Example:

```dart
class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
```

To allow private widgets to live in separate files while remaining part of the same Dart library, use `part` and `part of`.

### Main View

```dart
import 'package:flutter/material.dart';

part 'widgets/login_content.dart';
part 'widgets/login_form.dart';
part 'widgets/login_submit_button.dart';

class LoginView extends BaseView<LoginCubit, LoginState> {
  const LoginView({super.key});

  @override
  Widget buildContent(
    BuildContext context,
    LoginCubit cubit,
  ) {
    return const _LoginContent();
  }
}
```

### Widget File

```dart
part of '../login_view.dart';

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    return const _LoginForm();
  }
}
```

Another widget:

```dart
part of '../login_view.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Form fields
      ],
    );
  }
}
```

The rule is:

```text
View-only Widget
    ↓
view/widgets/
    ↓
private class
    ↓
part / part of
```

Do not make a View-specific widget public unless it is intentionally reused outside that View.

If a widget becomes reusable across multiple screens or features, move it to the appropriate shared presentation location instead of keeping it inside `view/widgets/`.

---

## BaseCubit

`BaseCubit<State>` contains shared Cubit behavior used throughout the application.

Typical responsibilities include:

- `init()` lifecycle
- loading state control
- shared error presentation
- toast helpers
- timer helpers
- safe state emission
- common presentation utilities
- Cubit lifecycle management

Example:

```dart
@injectable
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._loginUsecase)
      : super(const LoginState());

  final LoginUsecase _loginUsecase;
}
```

Feature Cubits should contain feature-specific behavior only.

For example:

```text
Form validation
Login submission
Feature-specific navigation events
Feature-specific state changes
```

Infrastructure behavior should remain inside shared base components.

---

## ApiResult

`ApiResult<T>` is the common result wrapper used by remote and local operations.

It represents either:

```text
Success<T>
```

or:

```text
Failure<ApiErrorModel>
```

Typical Cubit usage:

```dart
final result = await _loginUsecase(params);

await result.when(
  success: (response) async {
    // Handle success.
  },
  failure: (error) async {
    showToastError(error: error);
  },
);
```

The Presentation layer should not need to understand infrastructure exceptions such as:

```text
DioException
SocketException
TimeoutException
LocalAuthException
FormatException
```

They are normalized before reaching the Cubit.

---

## BaseResponseModel

`BaseResponseModel<T>` represents the backend response envelope inside the Data layer.

The backend uses two response structures.

### Success Response

```json
{
  "success": true,
  "data": {},
  "message": "Optional success message"
}
```

### Error Response

```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Error message",
    "details": {}
  }
}
```

The shared model represents both structures:

```dart
class BaseResponseModel<T> {
  const BaseResponseModel({
    required this.success,
    this.data,
    this.message,
    this.error,
  });

  final bool success;
  final T? data;
  final String? message;
  final ApiErrorModel? error;
}
```

The shared fields are:

```text
success
data
message
error
```

---

## ApiErrorModel

`ApiErrorModel` represents backend errors and is also used as the normalized application error type.

Example:

```dart
class ApiErrorModel implements Exception {
  const ApiErrorModel({
    this.code,
    this.message,
    this.details = const {},
    this.statusCode,
    this.originalError,
  });

  final String? code;
  final String? message;
  final Map<String, String> details;

  final int? statusCode;
  final Object? originalError;

  bool get hasDetails => details.isNotEmpty;
}
```

The backend supplies:

```text
code
message
details
```

The Flutter application may additionally attach:

```text
statusCode
originalError
```

Business decisions should use `code`.

Example:

```dart
if (error.code == 'AUTH_EMAIL_NOT_VERIFIED') {
  // Handle verification flow.
}
```

Do not use message text for business logic.

---

## BaseTransformResponseModel

`BaseTransformResponseModel<T>` defines the contract for converting Data models into Domain entities.

Example:

```dart
class LoginContentModel
    extends BaseTransformResponseModel<LoginContentEntity> {
  @override
  LoginContentEntity toEntity() {
    return LoginContentEntity(...);
  }
}
```

The transformation direction is:

```text
Data Model
   ↓
toEntity()
   ↓
Domain Entity
```

This ensures that:

- JSON models remain inside the Data layer
- Domain entities do not depend on API implementation details
- repositories return Domain objects instead of raw response models

---

## BaseResponseEntity

`BaseResponseEntity<T>` is the Domain representation of a successful backend response.

Example:

```dart
class BaseResponseEntity<T> {
  const BaseResponseEntity({
    required this.success,
    this.data,
    this.message,
  });

  final bool success;
  final T? data;
  final String? message;
}
```

Repository contracts commonly return:

```dart
Future<ApiResult<BaseResponseEntity<T>>>
```

---

## SafeRequest

`SafeRequest` is the common execution layer for remote API operations.

It centralizes:

- HTTP response handling
- backend `success` validation
- exception handling
- backend error extraction
- error normalization
- model-to-entity transformation
- successful response wrapping

Typical repository usage:

```dart
return SafeRequest.execute<LoginContentEntity>(
  request: _apiService.loginUser(...),
);
```

For list responses:

```dart
SafeRequest.executeList<Entity>(
  request: _apiService.getItems(),
);
```

---

## SafeLocalRequest

`SafeLocalRequest` applies the same safe execution approach to local operations.

It can be used for:

- biometrics
- secure storage
- shared preferences
- device information
- platform channels
- native SDK operations
- local database operations
- filesystem operations

Example:

```dart
return SafeLocalRequest.execute<bool>(
  request: () {
    return _biometricService.authenticate(
      localizedReason: localizedReason,
    );
  },
);
```

For operations returning `void`:

```dart
return SafeLocalRequest.executeVoid(
  request: _storageService.clear,
);
```

---

## ErrorHandler

`ErrorHandler` converts infrastructure and backend errors into the application's common `ApiErrorModel`.

Examples include:

```text
DioException
SocketException
TimeoutException
FormatException
LocalAuthException
HTTP 401
HTTP 403
HTTP 500
Backend business errors
```

All are normalized into:

```dart
ApiErrorModel
```

---

## CustomApiBuilder

`CustomApiBuilder` is responsible for rendering API state when an API request is executed automatically as part of entering or initializing a screen.

It handles:

```text
Loading
Error
Empty
Success
```

Typical usage:

```dart
CustomApiBuilder(
  isLoading: state.isLoading,
  apiErrorModel: state.apiErrorModel,
  isEmpty: state.items.isEmpty,
  onSuccessBuilder: (context) {
    return const _Content();
  },
)
```

`CustomApiBuilder` should be used when the API request happens automatically when the user enters the screen.

Examples:

```text
Open Vehicles screen → load vehicles
Open Profile screen → load profile
Open Dashboard screen → load dashboard data
Open Vehicle Details screen → load vehicle details
```

The screen State owns this API lifecycle.

Example State:

```dart
@freezed
abstract class VehiclesState with _$VehiclesState {
  const factory VehiclesState({
    @Default(true) bool isLoading,
    ApiErrorModel? apiErrorModel,
    @Default([]) List<VehicleEntity> vehicles,
  }) = _VehiclesState;
}
```

Example Cubit:

```dart
@override
Future<void> init() async {
  await getVehicles();
}

Future<void> getVehicles() async {
  emit(
    state.copyWith(
      isLoading: true,
      apiErrorModel: null,
    ),
    withoutCloseLoading: true,
  );

  final result = await _getVehiclesUsecase();

  await result.when(
    success: (response) async {
      emit(
        state.copyWith(
          isLoading: false,
          apiErrorModel: null,
          vehicles: response.data ?? const [],
        ),
        withoutCloseLoading: true,
      );
    },
    failure: (error) async {
      emit(
        state.copyWith(
          isLoading: false,
          apiErrorModel: error,
        ),
        withoutCloseLoading: true,
      );
    },
  );
}
```

View:

```dart
CustomApiBuilder(
  isLoading: state.isLoading,
  apiErrorModel: state.apiErrorModel,
  isEmpty: state.vehicles.isEmpty,
  onSuccessBuilder: (context) {
    return const _VehiclesContent();
  },
)
```

---

## Loading Strategy

There are two different API loading strategies.

### Initial Screen API Request

If an API request is executed automatically when the user enters the screen, use:

```dart
CustomApiBuilder
```

Do not use:

```dart
showLoading()
```

for this type of request.

The loading and error state belong to the feature State.

### User Action API Request

If the screen is already visible and the API request is triggered by a user action, use:

```dart
showLoading()
```

from `BaseCubit`.

Examples:

```text
Login
Register
Save
Delete
Submit
Verify OTP
Resend OTP
Add Vehicle
Update Vehicle
Logout
Change Password
```

Example:

```dart
Future<void> login() async {
  if (!state.canSubmit) {
    return;
  }

  showLoading();

  final result = await _loginUsecase(params);

  await result.when(
    success: (response) async {
      emit(
        state.copyWith(
          loginSuccess: true,
        ),
      );
    },
    failure: (error) async {
      showToastError(
        error: error,
      );
    },
  );
}
```

---

## Do Not Call hideLoading Manually

For user-action API requests, do not manually call:

```dart
hideLoading();
```

The loading dialog must be closed by the next presentation event.

For success:

```dart
emit(...)
```

For failure:

```dart
showToastError(...)
```

or:

```dart
showError(...)
```

The rule is:

```text
API called on screen entry
    ↓
CustomApiBuilder

API called because of user action
    ↓
cubit.showLoading()
    ↓
emit / show error closes loading
```

Never use `CustomApiBuilder` loading and `showLoading()` for the same API request.

---

## Presentation Structure

A typical feature Presentation layer should follow:

```text
presentation/
├── cubit/
│   ├── login_cubit.dart
│   └── login_state.dart
│
└── view/
    ├── login_view.dart
    └── widgets/
        ├── login_content.dart
        ├── login_form.dart
        └── login_submit_button.dart
```

View-specific widgets should:

- live inside `view/widgets/`
- use private class names
- use `part` in the main view file
- use `part of` inside the widget file
- remain scoped to the View library

---

## Architecture Rules

- Views contain page composition only.
- View-specific widgets go inside `view/widgets/`.
- View-specific widgets should be private.
- Private View widgets in separate files should use `part` and `part of`.
- Cubits call UseCases, not Retrofit services directly.
- UseCases depend on repository contracts.
- Repository contracts live in the Domain layer.
- Repository implementations live in the Data layer.
- Remote repository implementations use `SafeRequest`.
- Local repository implementations use `SafeLocalRequest`.
- API models stay inside the Data layer.
- Domain entities must not depend on API models.
- Response models map into Domain entities through `toEntity()`.
- Backend error codes are used for business decisions.
- Error messages are used for display only.
- Infrastructure exceptions must be normalized through `ErrorHandler`.
- API calls executed automatically on screen entry must use `CustomApiBuilder`.
- API calls triggered by user actions must use `cubit.showLoading()`.
- Do not call `hideLoading()` manually after user-action API requests.
- For user-action requests, `emit(...)`, `showToastError(...)`, or `showError(...)` is responsible for closing loading.
- Never use `CustomApiBuilder` loading and `showLoading()` for the same API request.

---

## Why Base Layers Exist

Without shared base layers, every feature would repeatedly implement:

```text
loading handling
try/catch
HTTP validation
error parsing
backend error mapping
model transformation
local exception handling
screen structure
Cubit utilities
```

The main rule is:

```text
Shared behavior → Base Layer
Feature behavior → Feature
```
