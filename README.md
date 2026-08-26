Sayarti Mobile

Flutter mobile application for Sayarti, a vehicle management platform that allows users to manage their vehicles, fuel consumption, maintenance, expenses, reminders, notifications, statistics, and vehicle-related costs.

This README is the main:

* Product scope
* Mobile development roadmap
* Development checklist
* Implementation progress tracker
* Feature status reference

Every feature must remain unchecked until the corresponding work is actually implemented and verified.

⸻

Project Status

Project: Sayarti Mobile
Platform: Flutter
Version: V1
Status: In Development

⸻

Documentation

The project uses the following architecture documentation:

README.md
→ Product roadmap and implementation progress
API_LAYERS_README.md
→ Domain + Data API architecture source of truth

Codex MUST read the relevant documentation before implementing a feature.

For any Domain/Data/API task:

Read API_LAYERS_README.md first.

⸻

Development Status Rules

Use:

[ ] Not implemented
[x] Implemented and verified

Do not mark a task complete merely because files were created.

A feature should only be marked complete after the corresponding implementation actually works.

For API-based features, track the layers independently:

Domain
Data
Presentation
Integration

Example:

[x] Login Domain
[x] Login Data
[ ] Login Presentation
[ ] Login Integration

This prevents partially implemented features from being incorrectly marked as complete.

⸻

Definition of Done

A complete frontend feature normally requires:

Domain
+
Data
+
Presentation
+
API Integration
+
Error Handling
+
Loading State
+
Empty State where applicable
+
Localization
+
Navigation
+
Static Analysis
+
Runtime Verification

If only Domain/Data are implemented, mark only those items complete.

⸻

Core Development Rules

Codex MUST:

1. Read this README before implementing a feature.
2. Read API_LAYERS_README.md before changing Domain/Data/API code.
3. Inspect an existing similar implementation before creating new architecture.
4. Follow the existing project structure.
5. Work on one logical feature at a time.
6. Do not implement features outside the requested scope.
7. Do not mark partially implemented features complete.
8. Do not create unnecessary architectural abstractions.
9. Reuse existing base classes and components.
10. Preserve Domain → Data → Presentation boundaries.
11. Run code generation when required.
12. Run formatting after implementation.
13. Run static analysis after implementation.
14. Fix implementation-related analyzer errors before marking work complete.
15. Do not modify unrelated files.

⸻

1. Project Foundation

* Flutter project initialized
* Domain layer created
* Data layer created
* Presentation layer created
* Dependency injection foundation
* Retrofit networking foundation
* Dio networking foundation
* ApiResult foundation
* SafeRequest foundation
* BaseResponseModel
* BaseResponseEntity
* BaseTransformResponseModel
* BaseRemoteUsecase
* BaseUsecaseParams
* API architecture documentation — API_LAYERS_README.md

⸻

2. Application Configuration

* Environment configuration
* Development environment
* Production environment
* Base URL configuration
* Build flavor strategy if required
* Application constants
* Secure configuration strategy

⸻

3. Networking

* Dio configuration
* Retrofit ApiService
* Standard API response support
* Standard API error support
* SafeRequest
* ApiResult
* Authentication interceptor
* Access-token attachment
* Refresh-token handling
* Automatic token refresh
* Unauthorized session handling
* Request logging for development
* Network connectivity handling

⸻

4. Local Storage

* Secure token storage
* Access-token persistence
* Refresh-token persistence
* Current-user persistence where required
* User preferences storage
* Selected language persistence
* Theme persistence where required
* Selected vehicle persistence where required

Do not store sensitive authentication tokens in insecure plain-text storage.

⸻

5. Authentication

5.1 Login

Backend:

POST /api/v1/auth/login

Domain

* LoginContentEntity
* UserEntity
* AuthRepository login contract
* LoginUseCase
* LoginUseCaseParams

Data

* LoginRequestModel
* LoginResponseModel
* LoginContentModel
* UserModel
* AuthRepositoryImpl login
* ApiService login endpoint
* Data-to-Domain transformation

Presentation

* Login Cubit/Bloc
* Login state
* Login page
* Email input
* Password input
* Client-side validation
* Password visibility
* Loading state
* API error handling
* Email-not-verified handling

Integration

* Persist authentication tokens
* Persist/update authenticated user
* Navigate after successful login
* Redirect unverified account to Email Verification
* Runtime verification

⸻

5.2 Registration

Backend:

POST /api/v1/auth/register

Request:

firstName
lastName
email
password
countryCode

Registration creates an unverified LOCAL account and starts email verification.

Domain

* RegistrationEntity
* AuthRepository register contract
* RegisterUseCase
* RegisterUseCaseParams

Data

* RegisterRequestModel
* RegisterResponseModel
* RegistrationModel
* AuthRepositoryImpl register
* ApiService register endpoint
* Data-to-Domain transformation

Presentation

* Register Cubit/Bloc
* Register state
* Register page
* First-name input
* Last-name input
* Email input
* Password input
* Country selector
* Registration validation
* Loading state
* API error handling

Integration

* Load countries for registration
* Submit country code
* Navigate to Email Verification after successful registration
* Pass registered email to verification flow
* Runtime verification

⸻

5.3 Email Verification

Backend:

POST /api/v1/auth/verify-email

Request:

email
otp

OTP is a six-digit numeric string.

Domain

* VerifyEmailUseCase
* VerifyEmailUseCaseParams
* AuthRepository verifyEmail contract
* Reuse authentication session entity where appropriate

Data

* VerifyEmailRequestModel
* VerifyEmailResponseModel if required
* Reuse Auth/Login content model where appropriate
* AuthRepositoryImpl verifyEmail
* ApiService verifyEmail endpoint

Presentation

* Verify Email Cubit/Bloc
* Verify Email state
* OTP page
* Six-digit OTP input
* OTP validation
* Loading state
* Invalid OTP handling
* Expired OTP handling
* Attempts-exceeded handling

Integration

* Persist tokens after successful verification
* Persist/update user
* Navigate to authenticated application
* Runtime verification

⸻

5.4 Resend Email Verification

Backend:

POST /api/v1/auth/resend-verification

Domain

* [x] ResendVerificationUseCase
* [x] ResendVerificationUseCaseParams
* [x] AuthRepository resendVerification contract

Data

* [x] ResendVerificationRequestModel
* [x] ResendVerification response model/entity if required
* [x] AuthRepositoryImpl resendVerification
* [x] ApiService resendVerification endpoint

Presentation

* Resend OTP action
* Resend loading state
* Cooldown timer
* Resend-too-soon handling
* Success feedback
* Runtime verification

⸻

5.5 Google Authentication

Backend:

POST /api/v1/auth/google

Domain

* [x] GoogleLoginUseCase
* [x] GoogleLoginUseCaseParams
* [x] AuthRepository Google login contract

Data

* [x] GoogleLoginRequestModel
* [x] Google authentication API integration
* [x] AuthRepositoryImpl Google login
* [x] ApiService Google endpoint
* [x] Reuse authentication response models/entities where applicable

Platform

* Android Google Sign-In configuration
* iOS Google Sign-In configuration
* Retrieve Google ID token
* Send ID token to Sayarti Backend

Presentation

* Continue with Google button
* Loading state
* Google authentication error handling
* Account-linking-required handling

Integration

* Persist Sayarti tokens
* Persist/update user
* Navigate after authentication
* Runtime verification

⸻

5.6 Refresh Session

Backend:

POST /api/v1/auth/refresh

Domain

* [x] RefreshSessionUseCase
* [x] RefreshSessionUseCaseParams
* [x] AuthRepository refresh contract

Data

* [x] RefreshRequestModel
* [x] Refresh API endpoint
* [x] AuthRepositoryImpl refresh
* [x] Authentication response transformation

Integration

* Automatic refresh flow
* Replace old access token
* Replace rotated refresh token
* Failed refresh logout handling
* Runtime verification

⸻

5.7 Logout

Backend:

POST /api/v1/auth/logout

Domain

* [x] LogoutUseCase
* [x] LogoutUseCaseParams
* [x] AuthRepository logout contract

Data

* [x] Logout request
* [x] Logout response model/entity if required
* [x] AuthRepositoryImpl logout
* [x] ApiService logout endpoint

Integration

* Revoke server refresh token
* Clear local access token
* Clear local refresh token
* Clear authenticated user
* Return to authentication flow
* Runtime verification

⸻

6. Reference Data

6.1 Countries

Backend:

GET /api/v1/reference/countries

Country:

code
nameEn
nameAr
defaultCurrencyCode

Domain

* CountryEntity
* ReferenceRepository
* GetCountriesUseCase

Data

* CountryModel
* Countries response model
* ReferenceRepositoryImpl
* ApiService countries endpoint
* List → List

Presentation

* Country selector
* Localized country names
* Country loading state
* Country error state

Integration

* Registration country integration
* User-profile country integration where required
* Runtime verification

⸻

6.2 Currencies

Backend:

GET /api/v1/reference/currencies

Domain

* [x] CurrencyEntity
* [x] ReferenceRepository currencies contract
* [x] GetCurrenciesUseCase

Data

* [x] CurrencyModel
* [x] Currencies response model
* [x] Repository implementation
* [x] ApiService currencies endpoint
* [x] Data-to-Domain transformation

Presentation

* Currency selector
* Currency loading state
* Currency error state

Integration

* User default currency integration
* Runtime verification

⸻

7. User Profile

7.1 Get Current User

Backend:

GET /api/v1/users/me

* Domain
* Data
* Presentation
* Runtime verification

⸻

7.2 Update Current User

Backend:

PATCH /api/v1/users/me

* Domain
* Data
* Presentation
* Validation
* Runtime verification

⸻

7.3 Select Country

* Domain
* Data
* Presentation
* Refresh user state after update
* Runtime verification

⸻

7.4 Change Default Currency

* Domain
* Data
* Presentation
* Refresh user state after update
* Runtime verification

⸻

7.5 Delete Account

Backend:

DELETE /api/v1/users/me

* Domain
* Data
* Confirmation UI
* API integration
* Clear local authentication state
* Navigate to authentication
* Runtime verification

⸻

8. Vehicle Management

The backend vehicle feature includes vehicle creation, retrieval, update, mileage management, deletion, and ownership protection.

8.1 Get Vehicles

* Domain
* Data
* Vehicles page
* Loading state
* Empty state
* Error state
* Runtime verification

⸻

8.2 Get Vehicle Details

* Domain
* Data
* Vehicle details page
* Runtime verification

⸻

8.3 Create Vehicle

* Domain
* Data
* Create vehicle page
* Validation
* Refresh vehicles after creation
* Runtime verification

⸻

8.4 Update Vehicle

* Domain
* Data
* Edit vehicle page
* Validation
* Refresh vehicle after update
* Runtime verification

⸻

8.5 Update Vehicle Mileage

* Domain
* Data
* Mileage UI
* Mileage validation
* Runtime verification

⸻

8.6 Delete Vehicle

* Domain
* Data
* Delete confirmation
* Refresh vehicles after deletion
* Runtime verification

⸻

9. Fuel Tracking

The backend roadmap includes fuel records and fuel calculations such as distance between refills, fuel efficiency, L/100km, cost per kilometer, total fuel cost, and average efficiency.

Fuel Records

* Fuel Entity
* Fuel Models
* Fuel Repository
* Fuel Use Cases
* Get Fuel Records
* Get Fuel Record
* Create Fuel Record
* Update Fuel Record
* Delete Fuel Record
* Fuel history page
* Add fuel page
* Edit fuel page
* Empty state
* Runtime verification

Fuel Statistics

* Distance between refills
* Fuel efficiency
* L/100km
* Cost per kilometer
* Total fuel cost
* Average fuel efficiency
* Fuel statistics UI
* Charts where appropriate
* Runtime verification

⸻

10. Maintenance

The backend roadmap contains a dedicated Maintenance feature.

* Maintenance Entity
* Maintenance Models
* Maintenance Repository
* Maintenance Use Cases
* Get Maintenance Records
* Get Maintenance Record
* Create Maintenance Record
* Update Maintenance Record
* Delete Maintenance Record
* Maintenance history page
* Maintenance details page
* Add maintenance page
* Edit maintenance page
* Empty state
* Runtime verification

⸻

11. Expenses

* Expense Entity
* Expense Models
* Expense Repository
* Expense Use Cases
* Get Expenses
* Get Expense
* Create Expense
* Update Expense
* Delete Expense
* Expense categories
* Expense history page
* Expense details
* Add expense page
* Edit expense page
* Runtime verification

⸻

12. Reminders

* Reminder Entity
* Reminder Models
* Reminder Repository
* Reminder Use Cases
* Get Reminders
* Create Reminder
* Update Reminder
* Delete Reminder
* Reminder list
* Reminder details
* Add reminder
* Edit reminder
* Reminder status handling
* Runtime verification

⸻

13. Devices

* Device Entity
* Device Models
* Device Repository
* Device Use Cases
* Register Device
* Update FCM Token
* Remove Device
* Platform information
* Runtime verification

⸻

14. Notifications

Firebase

* Firebase project integration
* Android Firebase configuration
* iOS Firebase configuration
* Notification permission flow
* Retrieve FCM token
* Send FCM token to backend
* Token refresh handling

Notification Handling

* Foreground notification handling
* Background notification handling
* Terminated-state notification handling
* Notification tap routing
* Notification payload parsing
* Runtime verification on Android
* Runtime verification on iOS

⸻

15. Statistics

* Statistics Entity
* Statistics Models
* Statistics Repository
* Statistics Use Cases
* Vehicle statistics API
* Fuel statistics
* Maintenance statistics
* Expense statistics
* Statistics page
* Charts
* Filters
* Date range
* Runtime verification

⸻

16. Dashboard

* Dashboard Entity
* Dashboard Models
* Dashboard Repository
* Dashboard Use Case
* Dashboard API integration
* Dashboard page
* Vehicle summary
* Fuel summary
* Maintenance summary
* Expense summary
* Reminder summary
* Loading state
* Error state
* Runtime verification

⸻

17. Energy Tracking

Energy tracking is a separate future feature and must not be confused with ordinary vehicle fuel/powertrain fields.

* Confirm backend V1 contract
* Domain
* Data
* Presentation
* Statistics
* Runtime verification

Do not implement until the backend contract is ready.

⸻

18. Localization

Supported languages:

English
Arabic

* Localization foundation
* Language switching foundation
* Persist selected language
* Localize authentication
* Localize registration
* Localize email verification
* Localize vehicle management
* Localize fuel
* Localize maintenance
* Localize expenses
* Localize reminders
* Localize dashboard
* Localize validation messages
* Localize API-error presentation
* Verify RTL
* Verify LTR

⸻

19. Theme

* Theme foundation
* Final design tokens
* Typography
* Colors
* Input styles
* Button styles
* Dialog styles
* Loading styles
* Empty-state styles
* Error-state styles
* Dark mode if included in V1
* Persist theme preference if required

⸻

20. Navigation

* Final navigation architecture
* Splash routing
* Authentication routing
* Email-verification routing
* Authenticated routing
* Session-expired routing
* Deep-link strategy
* Notification routing

⸻

21. Shared Presentation Components

* Standard API builder
* Standard loading state
* Standard error state
* Standard empty state
* Standard buttons
* Standard text fields
* Password field
* OTP input
* Country selector
* Currency selector
* Confirmation dialog
* Bottom sheets
* Snackbar/toast strategy

Do not duplicate shared components between features.

⸻

22. Validation

* Shared email validation
* Shared password validation
* First-name validation
* Last-name validation
* OTP validation
* Country validation
* Vehicle validation
* Mileage validation
* Fuel-record validation
* Maintenance validation
* Expense validation

Frontend validation improves UX but does not replace backend validation.

⸻

23. Error Handling

* ApiErrorModel foundation
* ApiResult foundation
* SafeRequest foundation
* Standard Presentation error mapper
* Validation-error presentation
* Unauthorized handling
* Forbidden handling
* Session-expired handling
* Network-error handling
* Server-error handling
* Backend error-code-specific handling

Important authentication error flows include:

AUTH_INVALID_CREDENTIALS
AUTH_EMAIL_ALREADY_EXISTS
AUTH_EMAIL_NOT_VERIFIED
AUTH_EMAIL_ALREADY_VERIFIED
AUTH_OTP_INVALID
AUTH_OTP_EXPIRED
AUTH_OTP_ATTEMPTS_EXCEEDED
AUTH_OTP_RESEND_TOO_SOON
AUTH_ACCOUNT_LINKING_REQUIRED

⸻

24. Testing

Domain

* Use Case tests
* Repository contract behavior where applicable

Data

* Model serialization tests
* Model-to-Entity transformation tests
* Repository tests
* SafeRequest tests where required

Presentation

* Cubit/Bloc tests
* Widget tests for critical flows

Integration

* Authentication integration flow
* Registration integration flow
* Email verification integration flow
* Vehicle integration flow
* Fuel integration flow
* Maintenance integration flow
* Expense integration flow
* Notification integration flow

⸻

25. Code Quality

Before a task is marked complete:

* Code generation succeeds
* Dart formatting succeeds
* Static analysis succeeds
* No generated-file conflicts
* No broken imports
* No incorrect response generics
* No Data models exposed to Presentation
* No Data imports inside Domain
* No duplicated architecture
* No unrelated changes

⸻

26. V1 Feature Progress

Use this as the high-level project status.

Feature	Domain	Data	Presentation	Integrated
Login	✅	✅	⬜	⬜
Registration	✅	✅	⬜	⬜
Email Verification	✅	✅	⬜	⬜
Resend Verification	✅	✅	⬜	⬜
Google Authentication	✅	✅	⬜	⬜
Refresh Session	✅	✅	N/A	⬜
Logout	✅	✅	⬜	⬜
Countries	✅	✅	⬜	⬜
Currencies	✅	✅	⬜	⬜
User Profile	⬜	⬜	⬜	⬜
Vehicle Management	⬜	⬜	⬜	⬜
Fuel Tracking	⬜	⬜	⬜	⬜
Maintenance	⬜	⬜	⬜	⬜
Expenses	⬜	⬜	⬜	⬜
Reminders	⬜	⬜	⬜	⬜
Devices	⬜	⬜	N/A	⬜
Notifications	⬜	⬜	⬜	⬜
Statistics	⬜	⬜	⬜	⬜
Dashboard	⬜	⬜	⬜	⬜
Energy Tracking	⬜	⬜	⬜	⬜

⸻

27. Current Work

Current implementation priority:

Authentication Foundation
        ↓
Registration
        ↓
Countries
        ↓
Email Verification
        ↓
Resend Verification
        ↓
Complete Authentication Flow

Current Domain/Data task:

* [x] Registration Domain
* [x] Registration Data
* [x] Countries Domain
* [x] Countries Data
* [x] Verify Email Domain
* [x] Verify Email Data
* [x] Resend Verification Domain
* [x] Resend Verification Data
* [x] Google Authentication Domain
* [x] Google Authentication Data
* [x] Refresh Session Domain
* [x] Refresh Session Data
* [x] Logout Domain
* [x] Logout Data
* [x] Currencies Domain
* [x] Currencies Data

Do not start Presentation implementation as part of the current Domain/Data task unless explicitly requested.

⸻

28. Golden Rule

The README represents the actual state of the application.

Never change:

[ ]

to:

[x]

because implementation was started.

Change it only when the corresponding task is actually completed and verified.

Every Codex task that completes tracked functionality should update this README before finishing.

The final Codex report should explicitly state which README checkboxes were changed.
