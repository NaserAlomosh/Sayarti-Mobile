You are working on the Sayarti Flutter mobile application.

This document defines a STRICT and MANDATORY architectural rule for ALL current and future features.

You MUST follow the existing project architecture and MUST use the existing base layers already implemented in the repository.

Do NOT bypass them.
Do NOT create parallel abstractions.
Do NOT directly access local or remote services from Presentation.

==================================================
MANDATORY FIRST STEP
==================================================

Before implementing ANY task, feature, screen, local-storage operation, or remote API integration, you MUST read these files completely:

1. README.md
2. BASE_LAYERS_README.md
3. LOGIN_FEATURE_README.md
4. architecture.md

These files are the source of truth for:

- Project architecture
- Existing base layers
- Networking
- API response handling
- Error handling
- Loading handling
- Repository conventions
- UseCase conventions
- Dependency injection
- Cubit conventions
- Local storage conventions
- Remote-service conventions
- Presentation conventions
- Testing conventions
- Feature progress

Do NOT rely on memory from previous tasks.

Re-read their CURRENT content before every new task because these files may have changed.

==================================================
EXISTING BASE LAYERS ARE MANDATORY
==================================================

The project already contains base layers and reusable infrastructure.

You MUST inspect and reuse them.

This includes, where applicable:

- BaseCubit
- BaseView
- SafeRequest
- ApiResult
- BaseResponseModel
- BaseResponseEntity
- BaseTransformResponseModel
- ApiErrorModel
- CustomApiBuilder
- Existing loading handling
- Existing toast/error presentation
- Existing networking client
- Existing Retrofit ApiService
- Existing repository patterns
- Existing local-storage abstraction
- Existing dependency injection
- Existing localization
- Existing routing
- Existing theme
- Existing reusable widgets

If an existing base abstraction already solves the problem, USE IT.

Do NOT create:

- Another ApiResult
- Another SafeRequest
- Another API error model
- Another BaseCubit
- Another BaseView
- Another repository base
- Another networking wrapper
- Another loading system
- Another local-storage abstraction
- Another response wrapper
- Another theme system
- Another navigation abstraction

unless the owner explicitly requests a redesign.

The existing base architecture has priority over introducing a theoretically cleaner alternative.

Consistency with the current project is more important than inventing a second architecture.

==================================================
STRICT DATA FLOW RULE
==================================================

EVERY operation that reads from or writes to an external data source MUST pass through ALL required architecture layers.

This rule applies equally to REMOTE and LOCAL data.

The mandatory flow is:

DATA
    ↓
DOMAIN
    ↓
PRESENTATION

More explicitly:

Data Layer
    ↓
Repository Implementation
    ↓
Domain Repository Contract
    ↓
UseCase
    ↓
Cubit
    ↓
View

This rule is MANDATORY.

==================================================
REMOTE SERVICE FLOW
==================================================

Every remote API operation MUST follow this flow:

ApiService / RemoteService
        ↓
RepositoryImpl
        ↓
Repository
        ↓
UseCase
        ↓
Cubit
        ↓
View

Example:

ApiService.loginUser(...)
        ↓
AuthRepositoryImpl.login(...)
        ↓
AuthRepository.login(...)
        ↓
LoginUsernameAndPasswordUsecase
        ↓
LoginCubit.login()
        ↓
LoginState
        ↓
LoginView

Presentation must NEVER call ApiService directly.

FORBIDDEN:

LoginCubit
    ↓
ApiService

FORBIDDEN:

View
    ↓
ApiService

FORBIDDEN:

Cubit
    ↓
Retrofit service

FORBIDDEN:

Cubit
    ↓
Dio

==================================================
LOCAL SERVICE FLOW
==================================================

Local storage MUST follow the exact same architecture discipline.

Every LocalService / StorageService operation MUST follow:

LocalService / StorageService
        ↓
RepositoryImpl
        ↓
Repository
        ↓
UseCase
        ↓
Cubit
        ↓
View

Examples include:

- OnboardingStorage
- SharedPreferences wrapper
- SecureStorage
- Token storage
- User preferences
- Cached data
- Language persistence
- Theme persistence
- Firebase local values
- SQLite / Drift / Hive
- Device preferences
- Any future local persistence

The fact that the data is local DOES NOT allow architecture bypass.

==================================================
STRICTLY FORBIDDEN LOCAL ACCESS
==================================================

This is FORBIDDEN:

class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit(this._onboardingStorage);

  final OnboardingStorage _onboardingStorage;
}

because Presentation is directly depending on Data.

This is also FORBIDDEN:

Cubit
  ↓
SharedPreferences

Cubit
  ↓
FlutterSecureStorage

Cubit
  ↓
LocalService

Cubit
  ↓
StorageService

View
  ↓
LocalService

View
  ↓
Repository

Presentation must know application actions, not storage implementation details.

==================================================
CORRECT ONBOARDING EXAMPLE
==================================================

Checking onboarding completion must be:

OnboardingStorage
        ↓
OnboardingRepositoryImpl
        ↓
OnboardingRepository
        ↓
GetOnboardingStatusUseCase
        ↓
SplashCubit
        ↓
SplashView

Completing onboarding must be:

OnboardingStorage
        ↓
OnboardingRepositoryImpl
        ↓
OnboardingRepository
        ↓
CompleteOnboardingUseCase
        ↓
OnboardingCubit
        ↓
OnboardingView

SplashCubit must NOT receive OnboardingStorage directly.

OnboardingCubit must NOT receive OnboardingStorage directly.

==================================================
DATA LAYER
==================================================

The Data layer contains implementation details.

It may know about:

- Retrofit
- Dio
- ApiService
- HTTP
- LocalService
- SharedPreferences
- SecureStorage
- Hive
- Drift
- SQLite
- Firebase implementation classes
- JSON
- Request models
- Response models
- Persistence models
- Device/platform implementation details

Example local service:

abstract class OnboardingStorage {
  Future<bool> isCompleted();

  Future<void> setCompleted();
}

Example repository implementation:

@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl(
    this._onboardingStorage,
  );

  final OnboardingStorage _onboardingStorage;

  @override
  Future<bool> isCompleted() {
    return _onboardingStorage.isCompleted();
  }

  @override
  Future<void> complete() {
    return _onboardingStorage.setCompleted();
  }
}

RepositoryImpl is the boundary that coordinates concrete data sources.

==================================================
DOMAIN LAYER
==================================================

The Domain layer defines application contracts and behavior.

It contains:

- Entities
- Repository contracts
- UseCases
- UseCase params
- Domain-specific values

Example:

abstract class OnboardingRepository {
  Future<bool> isCompleted();

  Future<void> complete();
}

UseCase:

@lazySingleton
class GetOnboardingStatusUseCase {
  const GetOnboardingStatusUseCase(
    this._repository,
  );

  final OnboardingRepository _repository;

  Future<bool> call() {
    return _repository.isCompleted();
  }
}

Completion UseCase:

@lazySingleton
class CompleteOnboardingUseCase {
  const CompleteOnboardingUseCase(
    this._repository,
  );

  final OnboardingRepository _repository;

  Future<void> call() {
    return _repository.complete();
  }
}

==================================================
DOMAIN MUST NOT DEPEND ON DATA IMPLEMENTATION
==================================================

Domain MUST NOT import or depend on:

- Dio
- Retrofit
- ApiService
- SharedPreferences
- FlutterSecureStorage
- Hive
- Drift
- Firebase implementation classes
- Data-layer response models
- Data-layer request models
- LocalService implementations

Domain defines WHAT the application can do.

Data defines HOW it is done.

==================================================
PRESENTATION LAYER
==================================================

Presentation contains:

- Cubit
- State
- View
- Widgets

Cubit must depend on UseCases.

Correct:

@injectable
class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit(
    this._getOnboardingStatusUseCase,
  ) : super(const SplashState());

  final GetOnboardingStatusUseCase
      _getOnboardingStatusUseCase;

  Future<void> initSplash() async {
    final completed =
        await _getOnboardingStatusUseCase();

    emit(
      state.copyWith(
        showOnboarding: !completed,
      ),
      withoutCloseLoading: true,
    );
  }
}

Correct:

@injectable
class OnboardingCubit extends BaseCubit<OnboardingState> {
  OnboardingCubit(
    this._completeOnboardingUseCase,
  ) : super(const OnboardingState());

  final CompleteOnboardingUseCase
      _completeOnboardingUseCase;

  Future<void> completeOnboarding() async {
    await _completeOnboardingUseCase();

    emit(
      state.copyWith(
        completed: true,
      ),
      withoutCloseLoading: true,
    );
  }
}

Cubit asks WHAT should happen.

Cubit must not know HOW data is stored or fetched.

==================================================
USECASE RULE
==================================================

Every business/data operation exposed to Presentation must go through a UseCase.

Do NOT allow Presentation to call Repository directly.

FORBIDDEN:

Cubit
    ↓
Repository

Correct:

Cubit
    ↓
UseCase
    ↓
Repository

Even simple local operations must use a UseCase.

Examples:

GetOnboardingStatusUseCase

CompleteOnboardingUseCase

GetSavedLanguageUseCase

SaveLanguageUseCase

GetAccessTokenUseCase

SaveAccessTokenUseCase

ClearSessionUseCase

RegisterDeviceUseCase

LoginUseCase

GetVehiclesUseCase

CreateVehicleUseCase

The operation being small does not make it exempt from the architecture.

==================================================
REPOSITORY IMPLEMENTATION RULE
==================================================

RepositoryImpl is responsible for coordinating concrete data sources.

It may combine:

Remote API
+
Local Storage
+
Secure Storage
+
Cache

Example:

AuthRepositoryImpl
   ├── ApiService
   ├── TokenStorage
   └── UserStorage

The Cubit must NOT coordinate these separately.

FORBIDDEN:

class LoginCubit {
  LoginCubit(
    this._apiService,
    this._tokenStorage,
    this._userStorage,
  );
}

Correct:

class LoginCubit {
  LoginCubit(
    this._loginUseCase,
  );
}

Then:

LoginCubit
    ↓
LoginUseCase
    ↓
AuthRepository
    ↓
AuthRepositoryImpl
    ├── ApiService
    ├── TokenStorage
    └── UserStorage

==================================================
MANDATORY USE OF EXISTING BASE NETWORK LAYER
==================================================

For remote APIs, you MUST use the existing networking base layer.

If the current project already uses:

ApiService
+
HttpResponse
+
BaseResponseModel
+
BaseTransformResponseModel
+
SafeRequest
+
ApiResult
+
ApiErrorModel

then ALL new remote integrations must continue using this flow.

Do NOT bypass SafeRequest.

Do NOT manually wrap Dio calls inside Cubits.

Do NOT manually parse backend errors in feature Cubits if the base layer already handles them.

Do NOT create a feature-specific network response wrapper.

The expected remote flow is:

RequestModel
    ↓
ApiService
    ↓
HttpResponse<ResponseModel>
    ↓
SafeRequest
    ↓
ResponseModel / ContentModel
    ↓
toEntity()
    ↓
BaseResponseEntity<Entity>
    ↓
ApiResult
    ↓
UseCase
    ↓
Cubit

==================================================
REMOTE LOGIN EXAMPLE
==================================================

The expected Login architecture is:

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

Do not simplify this flow by bypassing layers.

==================================================
MODEL / ENTITY BOUNDARY
==================================================

Data models belong in Data.

Domain entities belong in Domain.

Presentation must consume Domain entities.

If transformation is required:

ResponseModel
    ↓
ContentModel
    ↓
toEntity()
    ↓
Entity

Do NOT expose Data-layer models directly to Cubits.

FORBIDDEN:

LoginCubit receives LoginResponseModel

VehicleCubit receives VehicleResponseModel

OnboardingCubit receives LocalStorageModel

Correct:

LoginCubit receives LoginContentEntity

VehicleCubit receives VehicleEntity

Presentation should consume stable Domain values.

==================================================
BASE RESPONSE RULE
==================================================

When an API follows the existing backend response structure:

{
  "success": true,
  "data": {},
  "message": "Optional success message"
}

or:

{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Error message",
    "details": {}
  }
}

you MUST reuse the existing:

- BaseResponseModel
- BaseResponseEntity
- ApiErrorModel
- SafeRequest
- ApiResult

Do NOT recreate these types per feature.

==================================================
BASE CUBIT RULE
==================================================

All Cubits must follow the existing BaseCubit behavior.

If BaseCubit already provides:

- showLoading()
- error presentation
- loading dismissal
- emit behavior
- toast handling
- shared API state behavior

reuse it.

Do NOT implement another loading mechanism inside a feature unless the project architecture explicitly requires it.

For user-triggered operations:

User Action
    ↓
showLoading()
    ↓
UseCase
    ↓
ApiResult
    ↓
emit(...) OR showToastError(...)
    ↓
BaseCubit closes loading

Do NOT manually call hideLoading() if BaseCubit documentation says emit/error handling closes it automatically.

==================================================
CUSTOM API BUILDER RULE
==================================================

If the project currently defines:

CustomApiBuilder

for APIs automatically loaded on screen entry, use it according to BASE_LAYERS_README.md.

Example:

Screen opens
    ↓
Cubit init()
    ↓
UseCase
    ↓
ApiResult
    ↓
State
    ↓
CustomApiBuilder
    ↓
Loading / Error / Empty / Success

Do NOT use showLoading() for automatic screen-load APIs when project rules require CustomApiBuilder.

Do NOT use CustomApiBuilder for user-submit actions such as Login if existing rules specify showLoading() instead.

Follow the current base-layer contract exactly.

==================================================
LOCAL OPERATIONS AND APIRESULT
==================================================

Do not automatically invent ApiResult wrapping for local operations if the existing architecture does not use it.

First inspect BASE_LAYERS_README.md and existing local-service patterns.

The layer flow is mandatory:

LocalService
    ↓
RepositoryImpl
    ↓
Repository
    ↓
UseCase
    ↓
Cubit

But the exact return type must follow the existing project convention.

Do not force network abstractions onto purely local operations unless the existing architecture already does so.

==================================================
DEPENDENCY INJECTION
==================================================

All dependencies must use the existing Injectable/GetIt conventions.

Do not manually instantiate:

- Repositories
- UseCases
- Services
- Cubits

inside Views.

Use existing annotations such as:

@injectable
@lazySingleton
@LazySingleton(as: ...)

according to the project's current conventions.

Do not create a second service locator.

==================================================
VIEW RULE
==================================================

Views must not directly execute:

- API calls
- Local storage calls
- Repository methods
- UseCases

The View communicates through Cubit.

Correct:

View
    ↓
Cubit

Not:

View
    ↓
UseCase

Not:

View
    ↓
Repository

Not:

View
    ↓
ApiService

Not:

View
    ↓
LocalStorage

==================================================
FEATURE WIDGET STRUCTURE
==================================================

Feature-specific widgets should follow the existing structure.

If the project uses:

view/widgets/

and private widgets through:

part
part of

then continue using that structure.

Example:

part 'widgets/login_content.dart';
part 'widgets/login_form.dart';

class LoginView extends BaseView<LoginCubit, LoginState> {
  ...
}

Widget:

part of '../login_view.dart';

class _LoginContent extends StatelessWidget {
  ...
}

Do not create inconsistent public widget files unless there is a real reusable cross-feature reason.

==================================================
NO ARCHITECTURE SHORTCUTS
==================================================

The following reasoning is NOT accepted:

"This is only SharedPreferences."

"This is only one boolean."

"This service is local."

"This API is simple."

"This feature only has one endpoint."

"This repository would only contain one method."

"This UseCase is only one line."

None of these are valid reasons to bypass the architecture.

Even:

bool isOnboardingCompleted

must follow:

LocalService
    ↓
RepositoryImpl
    ↓
Repository
    ↓
UseCase
    ↓
Cubit

Consistency across the project is the goal.

==================================================
NO DUPLICATION OF BASE LAYERS
==================================================

Before creating ANY infrastructure class:

1. Search the existing project.
2. Read BASE_LAYERS_README.md.
3. Check whether an equivalent already exists.
4. Reuse or extend the existing abstraction when appropriate.

Do NOT create duplicate classes such as:

ApiResponse
NetworkResult
ResultWrapper
Failure
NetworkException
ApiException
LoadingManager
StorageManager
BaseRepository

when equivalent project abstractions already exist.

==================================================
ERROR HANDLING
==================================================

Use the existing error infrastructure.

Backend errors must continue to use stable machine-readable error codes.

Do not implement business behavior by comparing localized error message strings.

Correct:

error.code == AUTH_EMAIL_NOT_VERIFIED

Wrong:

error.message == 'Email is not verified'

Reuse ApiErrorModel and existing BaseCubit error presentation behavior.

==================================================
LOCALIZATION
==================================================

User-facing strings must use the existing localization system.

Do not hardcode user-visible text.

Do not create another localization abstraction.

Respect Arabic and English support.

Respect RTL.

==================================================
TESTING REQUIREMENTS
==================================================

Every new implementation must have meaningful tests for all applicable layers.

If a new remote or local operation is added, test the appropriate layers:

Data:
- Service behavior where applicable
- RepositoryImpl behavior
- Model mapping

Domain:
- Repository contract interactions
- UseCase behavior

Presentation:
- Cubit behavior
- State transitions
- Widget behavior where applicable

Do not write tests that only verify that constructors exist.

Tests must verify real behavior.

==================================================
ARCHITECTURE TEST EXPECTATION
==================================================

Tests should make architectural violations difficult.

For example:

SplashCubit test should mock:

GetOnboardingStatusUseCase

It should NOT mock:

OnboardingStorage

because SplashCubit must not know OnboardingStorage exists.

OnboardingCubit test should mock:

CompleteOnboardingUseCase

It should NOT mock:

SharedPreferences

This serves as an architecture correctness check.

==================================================
BEFORE EVERY IMPLEMENTATION
==================================================

Before touching code:

1. Read README.md.
2. Read BASE_LAYERS_README.md.
3. Read LOGIN_FEATURE_README.md.
4. Read architecture.md.
5. Inspect the current feature.
6. Inspect existing Base layers.
7. Inspect related Repository contracts.
8. Inspect related RepositoryImpl classes.
9. Inspect existing UseCases.
10. Inspect existing local and remote services.
11. Inspect existing DI registration.
12. Inspect tests.
13. Identify which existing abstractions must be reused.

Do not begin implementation before understanding the current flow.

==================================================
AFTER EVERY IMPLEMENTATION
==================================================

After implementation:

1. Run code generation if required.
2. Run relevant unit tests.
3. Run repository tests.
4. Run Cubit tests.
5. Run widget tests where applicable.
6. Run:

flutter analyze

7. Run:

flutter test

8. Fix all task-related failures.
9. Review git diff.
10. Confirm no architecture shortcut was introduced.
11. Confirm no base-layer duplication was introduced.
12. Update README.md only for items genuinely completed.
13. Do not start another feature.

==================================================
FINAL ARCHITECTURE CHECK
==================================================

Before reporting completion, explicitly verify:

Remote operations:

ApiService
    ↓
RepositoryImpl
    ↓
Repository
    ↓
UseCase
    ↓
Cubit
    ↓
View

Local operations:

LocalService
    ↓
RepositoryImpl
    ↓
Repository
    ↓
UseCase
    ↓
Cubit
    ↓
View

Verify that NO Presentation class imports or injects:

- ApiService
- LocalService
- SharedPreferences
- SecureStorage
- Retrofit service
- Dio
- RepositoryImpl

Presentation may depend on:

- UseCases
- Domain entities
- Presentation/core abstractions

==================================================
FINAL REPORT
==================================================

At the end of every task, report:

1. Documentation files read
2. Existing base layers reused
3. Data sources involved
4. Data-layer classes created/modified
5. RepositoryImpl created/modified
6. Domain Repository created/modified
7. UseCases created/modified
8. Cubits created/modified
9. Views/widgets created/modified
10. Models/entities created/modified
11. Existing base API/error/loading infrastructure reused
12. Dependency injection changes
13. Tests added/updated
14. flutter analyze result
15. flutter test result
16. README checklist updates
17. Confirmation that no LocalService or RemoteService was accessed directly from Presentation
18. Confirmation that no existing base layer was duplicated or bypassed
19. Any remaining unverified behavior

==================================================
NON-NEGOTIABLE SUMMARY
==================================================

For EVERY RemoteService:

RemoteService / ApiService
    ↓
RepositoryImpl
    ↓
Repository
    ↓
UseCase
    ↓
Cubit
    ↓
View

For EVERY LocalService:

LocalService
    ↓
RepositoryImpl
    ↓
Repository
    ↓
UseCase
    ↓
Cubit
    ↓
View

Existing project Base Layers MUST be used.

No shortcuts.
No direct Presentation-to-Service dependency.
No direct Presentation-to-Repository dependency.
No duplicate base infrastructure.
No feature-specific replacement for existing shared infrastructure.

This architectural rule applies to ALL current and future Sayarti Flutter features.