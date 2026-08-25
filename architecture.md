Login Feature Example

This example shows how a Login feature should be implemented from API to UI using the application architecture and the current backend response contract.

The backend uses the following response structures.

Success Response

{
  "success": true,
  "data": {},
  "message": "Optional success message"
}

Error Response

{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Error message",
    "details": {}
  }
}

⸻

1. Domain Entity

The Domain layer contains application entities and must not depend on API models.

class LoginContentEntity {
  const LoginContentEntity({
    required this.token,
    required this.username,
  });
  final String? token;
  final String? username;
}

⸻

2. Base Response Entity

Successful API responses are converted from data models into domain entities.

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

⸻

3. Repository Contract

The Domain layer defines the repository contract.

abstract class AuthRepository {
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> login(
    LoginUsecaseParams params,
  );
}

The repository contract does not know anything about Retrofit, Dio, or API response models.

⸻

4. UseCase

The UseCase represents the Login business action.

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

⸻

5. Request Model

The Data layer converts UseCase parameters into the request expected by the backend.

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

⸻

6. Response Data Model

The model represents the data object returned inside a successful API response.

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

⸻

7. Base API Response Model

All API responses use the same base response structure.

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

For a successful response:

{
  "success": true,
  "data": {
    "token": "...",
    "username": "..."
  },
  "message": null
}

For an error response:

{
  "success": false,
  "error": {
    "code": "AUTH_INVALID_CREDENTIALS",
    "message": "Invalid credentials",
    "details": {}
  }
}

⸻

8. API Error Model

ApiErrorModel represents backend errors and is also used as the unified application error type.

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
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      code: json['code'] as String?,
      message: json['message'] as String?,
      details: _parseDetails(json['details']),
    );
  }
  static Map<String, String> _parseDetails(Object? value) {
    if (value is! Map) {
      return const {};
    }
    return value.map<String, String>(
      (key, value) => MapEntry(
        key.toString(),
        value?.toString() ?? '',
      ),
    );
  }
  @override
  String toString() => message ?? 'Unknown error';
}

The backend fields are:

code
message
details

The application can additionally attach:

statusCode
originalError

⸻

9. Login Response Model

Each endpoint can define its typed response model using BaseResponseModel.

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

There is no longer any:

content
status
requestDateTime
logId
StatusModel

The API contract is now based on:

success
data
message
error

⸻

10. Retrofit Service

The Retrofit service only defines the HTTP endpoint and request/response models.

@POST('/api/v1/auth/login')
Future<HttpResponse<LoginResponseModel>> loginUser(
  @Body() LoginRequestModel request,
);

Retrofit returns:

HttpResponse<LoginResponseModel>

SafeRequest is responsible for validating and transforming the response.

⸻

11. Repository Implementation

The repository connects the Domain layer to the Data layer.

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

The repository:

1. Receives Domain parameters.
2. Creates the API request model.
3. Calls Retrofit.
4. Passes the response to SafeRequest.
5. Returns only Domain entities to the caller.

⸻

12. SafeRequest

SafeRequest handles successful API responses and transforms response models into Domain entities.

Conceptually:

final response = httpResponse.data;
if (!response.success) {
  // Return ApiErrorModel
}
final model = response.data;
final entity = model.toEntity();
return ApiResult.success(
  BaseResponseEntity(
    success: response.success,
    data: entity,
    message: response.message,
  ),
);

A successful response:

{
  "success": true,
  "data": {
    "token": "...",
    "username": "..."
  },
  "message": null
}

becomes:

BaseResponseEntity<LoginContentEntity>(
  success: true,
  data: LoginContentEntity(...),
  message: null,
)

⸻

13. Error Handling

HTTP and API errors are handled centrally through ErrorHandler.

For example, the backend may return:

{
  "success": false,
  "error": {
    "code": "AUTH_EMAIL_NOT_VERIFIED",
    "message": "Email verification is required",
    "details": {}
  }
}

ErrorHandler converts this into:

ApiErrorModel(
  code: 'AUTH_EMAIL_NOT_VERIFIED',
  message: 'Email verification is required',
  statusCode: 403,
)

The UI and Cubit should use the error code for business decisions instead of comparing error message strings.

Example:

if (error.code == 'AUTH_EMAIL_NOT_VERIFIED') {
  // Navigate to email verification.
}

Do not use:

if (error.message == 'Email verification is required') {
  // ...
}

Messages may change or be localized, while error codes form part of the API contract.

⸻

14. State

The State contains only the values required by the UI.

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool canSubmit,
    @Default(false) bool loginSuccess,
  }) = _LoginState;
}

⸻

15. Cubit

The Cubit owns UI behavior and executes the Login UseCase.

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
      state.copyWith(
        canSubmit: canSubmit,
      ),
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
        final login = response.data;
        if (login == null) {
          return;
        }
        emit(
          state.copyWith(
            loginSuccess: true,
          ),
        );
      },
      failure: (error) async {
        if (error.code == 'AUTH_EMAIL_NOT_VERIFIED') {
          // Handle email verification flow if required.
          return;
        }
        showToastError(
          error: error,
        );
      },
    );
  }
  void consumeLoginSuccess() {
    emit(
      state.copyWith(
        loginSuccess: false,
      ),
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

⸻

16. View

The View only renders State and delegates actions to the Cubit.

class LoginView extends BaseView<LoginCubit, LoginState> {
  const LoginView({
    super.key,
  });
  @override
  Widget buildContent(
    BuildContext context,
    LoginCubit cubit,
  ) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          !previous.loginSuccess &&
          current.loginSuccess,
      listener: (context, state) {
        cubit.consumeLoginSuccess();
        Navigator.of(context).pushReplacementNamed(
          '/dashboard',
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: cubit.usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: cubit.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 24),
            BlocSelector<LoginCubit, LoginState, bool>(
              selector: (state) => state.canSubmit,
              builder: (context, canSubmit) {
                return FilledButton(
                  onPressed:
                      canSubmit ? cubit.login : null,
                  child: const Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

⸻

Final Success Flow

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
ApiResult.success
   ↓
LoginCubit
   ↓
LoginState
   ↓
LoginView

Final Error Flow

Backend ErrorResponse
   ↓
DioException
   ↓
ErrorHandler
   ↓
ApiErrorModel
   ↓
ApiResult.failure
   ↓
LoginCubit
   ↓
Business handling / Error UI

Architecture Rules

* BaseResponseModel<T> represents the API response envelope.
* BaseResponseEntity<T> represents a successful response in the Domain layer.
* ApiErrorModel represents application and API errors.
* API models must stay inside the Data layer.
* Domain entities must not depend on API models.
* Response data models should extend BaseTransformResponseModel<E>.
* Conversion from Model to Entity happens inside SafeRequest.
* Retrofit must not be accessed directly from Cubits.
* Cubits communicate with repositories through UseCases.
* Backend error codes should be used for business error handling.
* Error messages should be used for display only.
* HTTP, parsing, timeout, connectivity, and backend errors must be normalized through ErrorHandler.