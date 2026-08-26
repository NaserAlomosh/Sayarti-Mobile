API Layers Architecture Guide

This document defines the mandatory architecture and implementation structure for API-related code in the Domain and Data layers of the Sayarti Mobile application.

Codex and all contributors MUST follow this structure when implementing a new API or modifying an existing API.

The purpose of this document is consistency.

Do not introduce alternative architectural patterns, additional abstraction layers, or different naming conventions unless explicitly requested.

⸻

1. Scope

This document covers only:

* Domain layer
* Data layer
* Remote API implementation
* Request models
* Response models
* Domain entities
* Repository contracts
* Repository implementations
* Use cases
* Retrofit API services
* Data-to-Domain transformation
* SafeRequest
* ApiResult

Presentation-layer implementation is outside the scope of this document.

⸻

2. Architecture Flow

Every remote API MUST follow this flow:

Presentation
    ↓
UseCase
    ↓
Repository Contract
    ↓
Repository Implementation
    ↓
ApiService
    ↓
Remote API

The response travels back through:

Remote JSON
    ↓
Response Model
    ↓
Content Model
    ↓
toEntity()
    ↓
Domain Entity
    ↓
BaseResponseEntity<T>
    ↓
ApiResult<BaseResponseEntity<T>>
    ↓
UseCase
    ↓
Presentation

The Domain layer must never depend on Retrofit, Dio, JSON serialization, or API response models.

The Data layer is responsible for communicating with the remote API and transforming remote models into Domain entities.

⸻

3. Expected Folder Structure

Follow the existing project structure.

Example for an authentication Login API:

lib/
├── domain/
│   ├── base/
│   │   ├── entity/
│   │   │   └── base_response_entity.dart
│   │   └── usecase/
│   │       ├── base_usecase.dart
│   │       └── base_usecase_params.dart
│   │
│   ├── entity/
│   │   └── remote/
│   │       └── auth/
│   │           ├── login_content_entity.dart
│   │           └── user_entity.dart
│   │
│   ├── repository/
│   │   └── remote/
│   │       └── auth/
│   │           └── auth_repository.dart
│   │
│   └── usecase/
│       └── remote/
│           └── auth/
│               └── login_usecase.dart
│
└── data/
    ├── base/
    │   ├── base_response_model.dart
    │   └── base_transform_response_model.dart
    │
    ├── model/
    │   └── remote/
    │       ├── request/
    │       │   └── auth/
    │       │       └── login/
    │       │           └── login_request_model.dart
    │       │
    │       └── response/
    │           └── auth/
    │               └── login/
    │                   ├── login_response_model.dart
    │                   ├── login_content_model.dart
    │                   └── user_model.dart
    │
    ├── repository/
    │   └── remote/
    │       └── auth/
    │           └── auth_repository_impl.dart
    │
    └── service/
        └── remote/
            └── api_service/
                └── api_service.dart

Do not create new folders or architectural layers when the existing structure already supports the feature.

⸻

4. Domain Layer

The Domain layer describes what the application needs without knowing how the remote API works.

It contains:

1. Entities
2. Repository contracts
3. Use cases
4. Use case parameters

The Domain layer MUST NOT contain:

* Retrofit
* Dio
* HttpResponse
* JsonSerializable
* JSON parsing
* Request models
* Response models
* API service implementations

⸻

5. Domain Entities

Remote API data exposed to the rest of the application must be represented by Domain entities.

Example:

class LoginContentEntity {
  const LoginContentEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
    required this.requiredAction,
  });
  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;
  final int? expiresIn;
  final UserEntity? user;
  final String? requiredAction;
}

Nested objects must also have their own Domain entities.

Example:

class UserEntity {
  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.authProvider,
    required this.countryCode,
    required this.defaultCurrencyCode,
    required this.preferredLanguage,
    required this.createdAt,
    required this.updatedAt,
  });
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? emailVerified;
  final String? authProvider;
  final String? countryCode;
  final String? defaultCurrencyCode;
  final String? preferredLanguage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}

Entity Rules

* Entity names MUST end with Entity.
* Entities MUST NOT contain JSON serialization.
* Entities MUST NOT import Data-layer models.
* Entities should use const constructors whenever possible.
* Entities represent data consumed by the application.
* Nested API objects should be represented using nested Domain entities.
* Keep entities independent from networking libraries.

⸻

6. Base Response Entity

Remote API operations return the common Domain response wrapper:

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

Repositories and remote use cases return:

ApiResult<BaseResponseEntity<T>>

Example:

Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> login(
  LoginUseCaseParams params,
);

Do not return Data models from Domain repository contracts.

⸻

7. Repository Contract

Repository contracts belong to the Domain layer.

Example:

abstract class AuthRepository {
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> login(
    LoginUseCaseParams params,
  );
}

Repository Contract Rules

Repository contracts:

* Define what operations are available.
* MUST NOT contain implementation logic.
* MUST NOT call ApiService.
* MUST NOT construct request models.
* MUST return Domain entities.
* MUST use the existing ApiResult structure.
* MUST use BaseResponseEntity<T> for remote API responses.

The standard remote repository return type is:

Future<ApiResult<BaseResponseEntity<EntityType>>>

⸻

8. Use Case Parameters

Every API operation requiring input parameters should define its own params class.

The params class extends:

BaseUsecaseParams

Example:

class LoginUseCaseParams extends BaseUsecaseParams {
  const LoginUseCaseParams({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}

Params Rules

* Name params classes using <Action>UseCaseParams.
* Extend BaseUsecaseParams.
* Keep API request models OUT of the Domain layer.
* Params should contain only values needed to perform the operation.
* Do not annotate params with JsonSerializable.
* Do not pass Data-layer request models into a use case.

⸻

9. Remote Use Cases

Remote use cases extend:

BaseRemoteUsecase<Entity, Params>

Example:

class LoginUseCase
    extends BaseRemoteUsecase<LoginContentEntity, LoginUseCaseParams> {
  const LoginUseCase(this._repository);
  final AuthRepository _repository;
  @override
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> call(
    LoginUseCaseParams params,
  ) =>
      _repository.login(params);
}

Use Case Rules

A use case:

* Depends on a Domain repository contract.
* MUST NOT depend on the repository implementation.
* MUST NOT access ApiService.
* MUST NOT construct request models.
* MUST NOT parse JSON.
* MUST NOT contain Retrofit or Dio logic.
* Delegates the operation to the repository.
* Returns Domain-layer types.

Naming:

<Action>UseCase
<Action>UseCaseParams

Examples:

LoginUseCase
LoginUseCaseParams
RegisterUseCase
RegisterUseCaseParams
RefreshTokenUseCase
RefreshTokenUseCaseParams

⸻

10. Data Layer

The Data layer handles remote communication and conversion of API data into Domain entities.

The Data layer contains:

* Request models
* Response models
* Content models
* Nested response models
* Repository implementations
* ApiService
* Networking utilities

⸻

11. Request Models

Every request body should have a dedicated request model.

Example:

import 'package:json_annotation/json_annotation.dart';
part 'login_request_model.g.dart';
@JsonSerializable()
class LoginRequestModel {
  const LoginRequestModel({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

Request Model Rules

Request models:

* Belong to the Data layer.
* MUST end with RequestModel.
* SHOULD use JsonSerializable.
* Represent the actual API request contract.
* MUST NOT be exposed to the Presentation layer.
* MUST NOT replace use case params.

The repository implementation converts:

UseCaseParams
    ↓
RequestModel

Example:

LoginRequestModel(
  email: params.email,
  password: params.password,
)

This conversion belongs in the repository implementation.

⸻

12. Response Content Models

API response content models belong to the Data layer.

They extend:

BaseTransformResponseModel<Entity>

Example:

@JsonSerializable()
class LoginContentModel
    extends BaseTransformResponseModel<LoginContentEntity> {
  const LoginContentModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
    required this.requiredAction,
  });
  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;
  final int? expiresIn;
  final UserModel? user;
  final String? requiredAction;
  factory LoginContentModel.fromJson(Map<String, dynamic> json) =>
      _$LoginContentModelFromJson(json);
  @override
  LoginContentEntity toEntity() => LoginContentEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
        tokenType: tokenType,
        expiresIn: expiresIn,
        user: user?.toEntity(),
        requiredAction: requiredAction,
      );
}

The most important responsibility of a response content model is:

toEntity()

This is the boundary between the Data and Domain representations.

⸻

13. Nested Response Models

Nested API objects follow exactly the same transformation rule.

Example:

@JsonSerializable()
class UserModel extends BaseTransformResponseModel<UserEntity> {
  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.authProvider,
    required this.countryCode,
    required this.defaultCurrencyCode,
    required this.preferredLanguage,
    required this.createdAt,
    required this.updatedAt,
  });
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? emailVerified;
  final String? authProvider;
  final String? countryCode;
  final String? defaultCurrencyCode;
  final String? preferredLanguage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  @override
  UserEntity toEntity() => UserEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        emailVerified: emailVerified,
        authProvider: authProvider,
        countryCode: countryCode,
        defaultCurrencyCode: defaultCurrencyCode,
        preferredLanguage: preferredLanguage,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

Nested transformation must also happen through toEntity():

user: user?.toEntity(),

Do not expose:

UserModel

inside:

LoginContentEntity

The Domain layer must only know:

UserEntity

⸻

14. Response Wrapper Models

When an endpoint returns the application’s standard response wrapper, create a response model extending:

BaseResponseModel<ContentModel>

Example:

import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/login_content_model.dart';
part 'login_response_model.g.dart';
@JsonSerializable()
class LoginResponseModel extends BaseResponseModel<LoginContentModel> {
  const LoginResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

The generic type MUST represent the response’s data content model.

Correct:

BaseResponseModel<LoginContentModel>

Incorrect:

BaseResponseModel<LoginResponseModel>

Never use the response wrapper itself as its own data generic type unless the backend contract genuinely contains that recursive structure.

⸻

15. Model Naming Rules

Use the following naming conventions consistently.

Responsibility	Naming
Domain entity	<Name>Entity
Request body	<Action>RequestModel
Response wrapper	<Action>ResponseModel
Response content	<Name>Model or <Action>ContentModel
Repository contract	<Feature>Repository
Repository implementation	<Feature>RepositoryImpl
Use case	<Action>UseCase
Use case parameters	<Action>UseCaseParams

Example:

LoginUseCase
LoginUseCaseParams
AuthRepository
AuthRepositoryImpl
LoginRequestModel
LoginResponseModel
LoginContentModel
LoginContentEntity
UserModel
UserEntity

⸻

16. Repository Implementation

Repository implementations belong to the Data layer.

Example:

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._apiService);
  final ApiService _apiService;
  @override
  Future<ApiResult<BaseResponseEntity<LoginContentEntity>>> login(
    LoginUseCaseParams params,
  ) async {
    return SafeRequest.execute<LoginContentEntity>(
      request: _apiService.login(
        LoginRequestModel(
          email: params.email,
          password: params.password,
        ),
      ),
    );
  }
}

Repository Implementation Responsibilities

The repository implementation is responsible for:

1. Receiving Domain use case params.
2. Creating the appropriate Data request model.
3. Calling ApiService.
4. Passing the request through SafeRequest.execute.
5. Returning ApiResult<BaseResponseEntity<Entity>>.

The repository implementation MUST NOT duplicate networking error handling already handled by SafeRequest.

Do not manually add unnecessary:

try {
  ...
} catch (...) {
  ...
}

around requests when SafeRequest.execute already owns that responsibility.

⸻

17. Dependency Injection

Repository implementations use the existing Injectable pattern.

Example:

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

The implementation depends on:

ApiService

while consumers depend on:

AuthRepository

Do not instantiate repositories manually.

Incorrect:

final repository = AuthRepositoryImpl(ApiService(...));

Use the project’s dependency injection setup.

⸻

18. ApiService

Remote endpoints are declared in the Retrofit ApiService.

Example:

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
  @POST('v1/auth/login')
  Future<HttpResponse<LoginResponseModel>> login(
    @Body() LoginRequestModel request,
  );
}

ApiService Rules

ApiService:

* Defines the HTTP method.
* Defines the endpoint.
* Defines request parameters/body.
* Defines the Data response model.
* Returns HttpResponse<ResponseModel> where required by the existing architecture.
* MUST NOT return Domain entities.
* MUST NOT contain business logic.
* MUST NOT perform Data-to-Domain mapping.
* MUST NOT call use cases or repositories.

⸻

19. SafeRequest

Repository implementations MUST use the existing SafeRequest abstraction for remote API execution.

Standard pattern:

return SafeRequest.execute<EntityType>(
  request: _apiService.someEndpoint(
    SomeRequestModel(...),
  ),
);

Example:

return SafeRequest.execute<LoginContentEntity>(
  request: _apiService.login(
    LoginRequestModel(
      email: params.email,
      password: params.password,
    ),
  ),
);

SafeRequest is the centralized boundary for handling the remote request and converting the API response into the project’s standard:

ApiResult<BaseResponseEntity<T>>

Do not duplicate its responsibilities inside individual repositories.

⸻

20. ApiResult

Remote operations expose their state using:

ApiResult<T>

For standard remote use cases, the expected result is:

ApiResult<BaseResponseEntity<EntityType>>

Example:

ApiResult<BaseResponseEntity<LoginContentEntity>>

Do not introduce another result abstraction such as:

Either
Result
NetworkResult
Resource
ResponseState

unless explicitly requested.

The project already has ApiResult. Use it.

⸻

21. Data-to-Domain Mapping

Mapping MUST happen through Data models implementing:

BaseTransformResponseModel<Entity>

and:

toEntity()

Example:

LoginContentModel
        ↓
     toEntity()
        ↓
LoginContentEntity

Nested objects:

UserModel
    ↓
 toEntity()
    ↓
UserEntity

The final transformation becomes:

LoginResponseModel
    data: LoginContentModel
              ↓
          toEntity()
              ↓
      LoginContentEntity
              ↓
           user
              ↓
          UserEntity

Do not create unnecessary standalone mapper classes when the existing architecture uses toEntity() directly on response models.

⸻

22. Complete Login Flow Example

The Login implementation should conceptually work as follows.

Step 1: Presentation calls

loginUseCase(
  LoginUseCaseParams(
    email: email,
    password: password,
  ),
);

Step 2: Use case delegates

_repository.login(params);

Step 3: Repository implementation converts params

LoginRequestModel(
  email: params.email,
  password: params.password,
)

Step 4: Repository calls ApiService

_apiService.login(request)

Step 5: Retrofit performs

POST v1/auth/login

Step 6: JSON becomes

LoginResponseModel

containing:

LoginContentModel

Step 7: Data model transforms

LoginContentModel.toEntity()

into:

LoginContentEntity

Nested:

UserModel.toEntity()

becomes:

UserEntity

Step 8: SafeRequest returns

ApiResult<BaseResponseEntity<LoginContentEntity>>

The Data models must not escape this boundary.

⸻

23. Adding a New API

When implementing a new endpoint, follow this order.

Domain

1. Create required entities

Example:

VehicleEntity
VehicleDetailsEntity

2. Add/update repository contract

Example:

Future<ApiResult<BaseResponseEntity<VehicleEntity>>> getVehicle(
  GetVehicleUseCaseParams params,
);

3. Create use case params

class GetVehicleUseCaseParams extends BaseUsecaseParams {
  const GetVehicleUseCaseParams({
    required this.vehicleId,
  });
  final String vehicleId;
}

4. Create use case

class GetVehicleUseCase
    extends BaseRemoteUsecase<VehicleEntity, GetVehicleUseCaseParams> {
  const GetVehicleUseCase(this._repository);
  final VehicleRepository _repository;
  @override
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> call(
    GetVehicleUseCaseParams params,
  ) =>
      _repository.getVehicle(params);
}

Data

5. Create request model if needed

GetVehicleRequestModel

Do not create an empty request model if the endpoint does not need one.

6. Create response/nested models

Example:

GetVehicleResponseModel
VehicleModel

7. Implement toEntity()

@override
VehicleEntity toEntity() => VehicleEntity(
  ...
);

8. Add endpoint to ApiService

@GET(...)
Future<HttpResponse<GetVehicleResponseModel>> getVehicle(...);

9. Implement repository method

return SafeRequest.execute<VehicleEntity>(
  request: _apiService.getVehicle(...),
);

10. Run code generation

After changing JsonSerializable or Retrofit classes, regenerate generated code using the project’s existing build command.

For example:

dart run build_runner build --delete-conflicting-outputs

or the project-provided Make command when available.

⸻

24. Nullability

Model nullability should follow the backend contract.

Do not make a field non-null merely because the UI expects it.

Example:

final String? accessToken;

If the backend may omit or return null for the value, preserve that nullability in the Data model and Domain entity.

Request fields that are mandatory for the API may remain non-null:

final String email;
final String password;

Do not add arbitrary fallback values during mapping.

Avoid:

accessToken: accessToken ?? '',

unless the application contract explicitly requires that behavior.

Prefer:

accessToken: accessToken,

⸻

25. JSON Serialization

Models representing JSON contracts should use the project’s existing json_serializable pattern.

Example:

@JsonSerializable()
class ExampleModel {

with:

part 'example_model.g.dart';

and:

factory ExampleModel.fromJson(Map<String, dynamic> json) =>
    _$ExampleModelFromJson(json);

Request models that need serialization should provide:

Map<String, dynamic> toJson() => _$ExampleModelToJson(this);

Do not manually parse ordinary JSON fields when json_serializable can handle them correctly.

Manual conversion is acceptable only when the API contract requires custom behavior.

⸻

26. Important Dependency Rules

The following dependency direction MUST be preserved:

Data → Domain

Data models may import Domain entities because they transform themselves into Domain entities.

Domain MUST NOT import Data models.

Valid:

// Data
import 'package:sayarti_mobile/domain/entity/...';

Invalid:

// Domain
import 'package:sayarti_mobile/data/model/...';

The Domain repository currently uses the project’s shared ApiResult abstraction. Preserve this existing project convention unless an architecture refactor is explicitly requested.

⸻

27. Do Not Introduce Unrequested Architecture

When implementing an API, Codex MUST NOT automatically introduce:

* RemoteDataSource
* LocalDataSource
* Mapper classes
* DTO classes in addition to existing Models
* Either
* dartz
* Result wrappers other than ApiResult
* New repository abstraction layers
* New networking clients
* New dependency injection patterns
* New base response abstractions
* New exception hierarchies

If the existing architecture already provides the required functionality, reuse it.

Consistency with the repository is more important than introducing a theoretically different architecture.

⸻

28. Do Not Bypass Layers

Forbidden:

Presentation → ApiService

Forbidden:

UseCase → ApiService

Forbidden:

Presentation → RepositoryImpl

Forbidden:

Domain → RequestModel

Forbidden:

Domain → ResponseModel

Required:

Presentation
    ↓
UseCase
    ↓
Repository
    ↓
RepositoryImpl
    ↓
ApiService

⸻

29. Source of Truth

When implementing a new API, inspect the existing repository before making assumptions.

The order of authority is:

1. Existing project architecture
2. Existing base classes
3. Existing networking utilities
4. Existing neighboring feature implementations
5. Backend API contract
6. This document

If a reusable project abstraction already exists, use it.

Do not duplicate existing functionality.

If the backend contract conflicts with an existing feature implementation, verify the actual contract instead of copying an incorrect implementation.

⸻

30. Codex Implementation Rules

When Codex is asked to implement a remote API, it MUST:

1. Read this document first.
2. Inspect the relevant existing Domain and Data files.
3. Inspect BaseRemoteUsecase.
4. Inspect BaseUsecaseParams.
5. Inspect BaseResponseEntity.
6. Inspect BaseResponseModel.
7. Inspect BaseTransformResponseModel.
8. Inspect ApiResult.
9. Inspect SafeRequest.
10. Inspect the existing ApiService.
11. Inspect at least one existing API implementation similar to the requested endpoint.
12. Reuse the existing architecture.
13. Preserve naming conventions.
14. Keep Domain independent from JSON/network models.
15. Map Data models to Domain entities using toEntity().
16. Use SafeRequest.execute from repository implementations.
17. Use existing dependency injection conventions.
18. Run code generation when generated files are affected.
19. Run formatting and static analysis after implementation.
20. Fix errors introduced by the implementation before considering the task complete.

Do not mark the implementation complete if generated code, analyzer errors, or type mismatches remain.

⸻

31. Implementation Checklist

Before considering a new API complete, verify:

* Domain entity exists.
* Nested Domain entities exist when required.
* Repository contract exists or has been updated.
* Use case params exist when input is required.
* Use case extends the correct base use case.
* Use case depends on the repository contract.
* Request model exists when a request body is required.
* Request model matches the backend contract.
* Response model matches the backend response.
* Response wrapper uses the correct generic content model.
* Response content model extends BaseTransformResponseModel.
* Every nested Data model maps to a Domain entity.
* toEntity() is implemented correctly.
* Repository implementation uses SafeRequest.execute.
* Repository implementation converts params to request models.
* Retrofit endpoint is added to ApiService.
* Correct HTTP method is used.
* Correct endpoint path is used.
* Correct request annotations are used.
* Repository implementation uses the existing Injectable pattern.
* No Data models leak into Domain entities.
* Domain does not import Data models.
* No unnecessary architectural layers were introduced.
* Generated files are regenerated.
* Code is formatted.
* Static analysis passes for the changed code.
* No unrelated files were modified.

⸻

32. Golden Rule

For every API implementation, preserve this boundary:

DOMAIN
────────────────────────────────────
Entity
Repository Contract
UseCase
UseCaseParams
              ↑ Domain types
              │
──────────────┼─────────────────────
              │
              ↓ Data implementation
DATA
────────────────────────────────────
RequestModel
ResponseModel
ContentModel
Nested Models
RepositoryImpl
SafeRequest
ApiService
Retrofit / Dio

And preserve this transformation:

API JSON
   ↓
ResponseModel
   ↓
ContentModel
   ↓
toEntity()
   ↓
Domain Entity
   ↓
BaseResponseEntity<Entity>
   ↓
ApiResult<BaseResponseEntity<Entity>>

When adding a new endpoint, copy this architectural pattern rather than inventing a new one.