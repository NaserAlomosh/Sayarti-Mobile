# Login Feature Example

This example shows how a Login feature should be implemented from API to UI using the application architecture and the current backend response contract.

## Success Response

```json
{
  "success": true,
  "data": {},
  "message": "Optional success message"
}
```

## Error Response

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

---

## 1. Domain Entity

```dart
class LoginContentEntity {
  const LoginContentEntity({
    required this.token,
    required this.username,
  });

  final String? token;
  final String? username;
}
```

---

## 2. Base Response Entity

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

---

## 3. Repository Contract

```dart
abstract class AuthRepository {
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> login(
    LoginUsecaseParams params,
  );
}
```

---

## 4. UseCase

```dart
@lazySingleton
class LoginUsernameAndPasswordUsecase {
  const LoginUsernameAndPasswordUsecase(this._repository);

  final AuthRepository _repository;

  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> call(
    LoginUsecaseParams params,
  ) {
    return _repository.login(params);
  }
}

class LoginUsecaseParams {
  const LoginUsecaseParams({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;
}
```

---

## 5. Request Model

```dart
@JsonSerializable()
class LoginRequestModel {
  const LoginRequestModel({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginRequestModelToJson(this);
}
```

---

## 6. Response Data Model

```dart
@JsonSerializable()
class LoginContentModel
    extends BaseTransformResponseModel<LoginContentEntity> {
  const LoginContentModel({
    this.token,
    this.username,
  });

  final String? token;
  final String? username;

  factory LoginContentModel.fromJson(Map<String, dynamic> json) =>
      _$LoginContentModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginContentModelToJson(this);

  @override
  LoginContentEntity toEntity() {
    return LoginContentEntity(
      token: token,
      username: username,
    );
  }
}
```

---

## 7. Base API Response Model

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

---

## 8. API Error Model

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

---

## 9. Login Response Model

```dart
@JsonSerializable(explicitToJson: true)
class LoginResponseModel
    extends BaseResponseModel<LoginContentModel> {
  const LoginResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory LoginResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseModelToJson(this);
}
```

---

## 10. Retrofit Service

```dart
@POST('/api/v1/auth/login')
Future<HttpResponse<LoginResponseModel>> loginUser(
  @Body() LoginRequestModel request,
);
```

---

## 11. Repository Implementation

```dart
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> login(
    LoginUsecaseParams params,
  ) {
    return SafeRequest.execute<LoginContentEntity>(
      request: _apiService.loginUser(
        LoginRequestModel(
          userName: params.userName,
          password: params.password,
        ),
      ),
    );
  }
}
```

---

## 12. State

```dart
@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool canSubmit,
    @Default(false) bool loginSuccess,
  }) = _LoginState;
}
```

---

## 13. Cubit

Login is triggered by a user action, so it uses `showLoading()` from `BaseCubit`.

Do not call `hideLoading()` manually. The next `emit(...)` or error presentation closes the loading state.

```dart
@injectable
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._loginUsecase)
      : super(const LoginState());

  final LoginUsernameAndPasswordUsecase _loginUsecase;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Future<void> init() async {
    usernameController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    final canSubmit =
        usernameController.text.trim().isNotEmpty &&
        passwordController.text.isNotEmpty;

    if (state.canSubmit == canSubmit) {
      return;
    }

    emit(
      state.copyWith(canSubmit: canSubmit),
      withoutCloseLoading: true,
    );
  }

  Future<void> login() async {
    if (!state.canSubmit) {
      return;
    }

    showLoading();

    final result = await _loginUsecase(
      LoginUsecaseParams(
        userName: usernameController.text.trim(),
        password: passwordController.text,
      ),
    );

    await result.when(
      success: (response) async {
        emit(
          state.copyWith(loginSuccess: true),
        );
      },
      failure: (error) async {
        showToastError(error: error);
      },
    );
  }

  void consumeLoginSuccess() {
    emit(
      state.copyWith(loginSuccess: false),
      withoutCloseLoading: true,
    );
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
```

---

## 14. View Structure

Feature-specific widgets should be inside:

```text
view/widgets/
```

and should be private using `part` and `part of`.

Example:

```dart
part 'widgets/login_content.dart';
part 'widgets/login_form.dart';

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

Widget file:

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

---

## Loading Rule

Login is a user-action API call:

```text
User presses Login
    ↓
showLoading()
    ↓
UseCase
    ↓
ApiResult
    ↓
emit(...) or showToastError(...)
    ↓
Loading closes
```

Do not use `CustomApiBuilder` for the login submission itself.

For APIs executed automatically when entering a screen, use `CustomApiBuilder` instead of `showLoading()`.

---

## Final Flow

```text
LoginView
   ↓
LoginCubit
   ↓
LoginUsernameAndPasswordUsecase
   ↓
AuthRepository
   ↓
AuthRepositoryImpl
   ↓
LoginRequestModel
   ↓
ApiService.loginUser
   ↓
HttpResponse<LoginResponseModel>
   ↓
SafeRequest
   ↓
LoginContentModel.toEntity()
   ↓
BaseResponseEntity<LoginContentEntity>
   ↓
ApiResult
   ↓
LoginCubit
   ↓
LoginState
   ↓
LoginView
```
