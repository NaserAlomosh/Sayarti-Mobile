Sayarti Mobile Application

Flutter mobile application for Sayarti, a vehicle management platform that allows users to manage vehicles, fuel consumption, maintenance, expenses, reminders, notifications, statistics, and vehicle-related activity.

This repository uses this README as the main:

* Product scope.
* Frontend architecture reference.
* UI implementation roadmap.
* Feature checklist.
* Development progress tracker.
* Definition of Done.
* Figma implementation tracker.
* Backend integration tracker.

Every feature must remain unchecked until it is fully implemented, tested, integrated where applicable, and verified.

⸻

Project Status

Project: Sayarti Mobile
Platform: Flutter
Targets: Android / iOS
Version: V1
Status: In Development

⸻

Source of Truth

The frontend has multiple sources of truth with clearly separated responsibilities.

Product and Progress

This README.md is the source of truth for:

* Feature scope.
* Implementation progress.
* Completed features.
* Pending features.
* V1 roadmap.
* Definition of Done.

Architecture

architecture.md is the source of truth for:

* Project architecture.
* Layer responsibilities.
* Feature structure.
* Dependency rules.
* State-management conventions.
* Navigation conventions.
* Dependency injection conventions.

Base Layers

BASE_LAYERS_README.md is the source of truth for:

* Networking.
* API state handling.
* Error handling.
* Common infrastructure.
* Shared base components.
* Core reusable abstractions.

Login Feature

LOGIN_FEATURE_README.md documents the Login feature and its implementation decisions.

Backend

The Sayarti Spring Boot backend is the source of truth for:

* API contracts.
* Authentication behavior.
* Validation rules.
* Error codes.
* Vehicle domain rules.
* Fuel calculations.
* Maintenance.
* Expenses.
* Reminders.
* Statistics.
* Notifications.
* Localization behavior.

The Flutter application must not duplicate backend business logic unnecessarily.

⸻

Figma

The Sayarti Figma design is the visual source of truth for the mobile application.

Main design:

Sayarti Mobile App

Figma determines:

* Layout.
* Colors.
* Typography.
* Spacing.
* Components.
* Images.
* Icons.
* Border radii.
* Shadows.
* Screen states.
* Light/dark appearance where designed.
* Navigation presentation.
* Empty states.
* Loading states.
* Error states.

Flutter implementations must not claim to match Figma unless the relevant Figma frame was actually inspected.

⸻

Core Development Rules

Codex must follow these rules during development:

1. Read this entire README.md before implementing a feature.
2. Read BASE_LAYERS_README.md.
3. Read LOGIN_FEATURE_README.md.
4. Read architecture.md.
5. Inspect the current implementation before changing code.
6. Inspect the relevant Figma frame when implementing UI.
7. Work on one logical feature at a time.
8. Follow the existing architecture.
9. Reuse existing base layers and reusable widgets.
10. Do not create parallel architecture.
11. Do not duplicate existing abstractions.
12. Do not introduce unnecessary dependencies.
13. Do not hardcode user-visible strings.
14. Do not hardcode global design-system colors inside feature widgets.
15. Use the existing localization system.
16. Support English and Arabic where applicable.
17. Respect LTR and RTL layouts.
18. Use the existing routing architecture.
19. Use the existing dependency-injection architecture.
20. Use the existing networking and API-state infrastructure.
21. Use the existing error-handling infrastructure.
22. Add meaningful automated tests for every implemented feature.
23. Run flutter analyze.
24. Run flutter test.
25. Fix failures before marking a feature complete.
26. Update this README only after the Definition of Done is satisfied.
27. Never mark partially implemented functionality complete.
28. Do not modify unrelated features.
29. Do not start the next feature automatically after completing the requested task.
30. Review the final diff before reporting completion.

⸻

Definition of Done

A feature may only change from:

- [ ] Feature

to:

- [x] Feature

after all applicable requirements are satisfied.

Architecture
+
Figma Implementation
+
Responsive Layout
+
Theme Integration
+
Localization
+
RTL Support
+
Navigation
+
State Management
+
Backend Integration where applicable
+
Loading State
+
Success State
+
Empty State where applicable
+
Error State
+
Input Validation where applicable
+
Automated Tests
+
flutter analyze
+
flutter test
+
Manual Verification

If any required part is missing, the feature remains unchecked.

A screen merely rendering successfully does NOT mean the feature is complete.

⸻

Completion Rules

UI-Only Feature

A UI-only feature is complete when:

Figma inspected
→ UI implemented
→ Theme reused
→ Localization implemented
→ RTL verified
→ Responsive behavior verified
→ Widget tests added
→ flutter analyze passes
→ flutter test passes

Backend-Connected Feature

A backend-connected feature is complete when:

UI complete
→ API contract inspected
→ Repository/data layer implemented
→ Request/response models implemented
→ State management implemented
→ Loading handled
→ Success handled
→ Empty state handled where applicable
→ API errors handled
→ Backend validation/errors mapped correctly
→ Tests added
→ flutter analyze passes
→ flutter test passes
→ Integration manually verified

Do not mark a backend-connected feature complete when only its UI exists.

⸻

1. Project Foundation

* Flutter project foundation verified
* Folder structure finalized
* Environment configuration finalized
* Android configuration finalized
* iOS configuration finalized
* Build variants/flavors finalized if required

⸻

2. Architecture

* Feature-based architecture finalized
* Presentation layer conventions finalized
* Domain layer conventions finalized
* Data layer conventions finalized
* Repository pattern finalized
* Dependency injection finalized
* State-management conventions finalized
* Navigation architecture finalized
* Shared logic free from unnecessary duplication

Implementation must follow architecture.md.

⸻

3. Base Layers

* Networking foundation
* API client
* Request configuration
* Authentication headers
* API response handling
* API error handling
* Loading-state handling
* Empty-state handling
* Common API builder
* Local storage abstraction
* Secure storage abstraction if required
* Connectivity handling if required

Implementation details belong in BASE_LAYERS_README.md.

Only mark items complete after verifying the existing implementation and tests.

⸻

4. Theme & Design System

* Figma design system inspected
* Color system implemented
* ThemeData implemented
* ColorScheme implemented
* Semantic theme colors implemented
* Button themes implemented
* Input themes implemented
* Card themes implemented
* Dialog themes implemented
* Bottom-sheet themes implemented
* Navigation themes implemented
* Progress/loading themes implemented
* Light theme implemented if designed
* Dark theme implemented if designed
* Theme switching implemented if required

⸻

5. Typography

Reusable typography:

* CustomTitleText
* CustomHintText
* CustomDescriptionText

Requirements:

* Typography roles must match Figma.
* Default colors come from the active theme.
* Font sizes for these custom widgets remain controlled by the widgets according to the project design decision.
* Do not duplicate typography implementations across features.

⸻

6. Localization

* Flutter localization configured
* English localization
* Arabic localization
* Runtime language switching
* RTL support
* Locale persistence
* Backend language integration
* Accept-Language integration where applicable

Supported languages:

English: en
Arabic: ar

User-visible feature strings must not be hardcoded.

⸻

7. Navigation

* Application router configured
* Route constants/names finalized
* Authentication navigation flow
* Startup navigation flow
* Protected navigation where required
* Unknown-route handling
* Navigation tests

⸻

8. Splash

* Splash View implemented from Figma
* Splash assets integrated
* Theme integration
* Responsive behavior
* Startup logic integration
* Splash tests
* Splash verified on Android
* Splash verified on iOS

Do not mark Splash complete based only on visual implementation.

⸻

9. Onboarding

* Onboarding 01 implemented from Figma
* Onboarding 02 implemented from Figma
* Onboarding 03 implemented from Figma
* Reusable onboarding page architecture
* PageView navigation
* Animated page indicator
* Skip behavior
* Next behavior
* Final CTA behavior
* Onboarding completion persistence
* Startup-flow integration
* English localization
* Arabic localization
* RTL verification
* Responsive layout verification
* Onboarding widget tests
* Onboarding navigation tests

Onboarding is complete only when the entire first-run flow works.

⸻

10. Authentication

Login

* Login UI implemented from Figma
* Email input
* Password input
* Client-side validation
* Password visibility behavior
* Login API integration
* Loading state
* Invalid-credentials handling
* Unverified-email handling
* Successful authentication persistence
* Navigation after login
* Login tests

Registration

* Registration UI
* Registration validation
* [x] Registration API integration
* Loading state
* Backend error handling
* Successful registration flow
* Navigation to email verification
* Registration tests

Email Verification

* OTP verification UI
* Six-digit OTP input
* [x] Verify-email API integration
* OTP expiration handling
* Invalid OTP handling
* Maximum-attempt handling
* [x] Resend verification
* Resend cooldown
* Successful verification
* Authentication persistence after verification
* Email-verification tests

Google Authentication

* Google Sign-In UI
* Google authentication integration
* Google ID token retrieval
* Backend Google authentication
* Account-linking-required handling
* Successful Google authentication persistence
* Google authentication tests

Session

* Access-token storage
* Refresh-token storage
* Automatic access-token usage
* Refresh-token flow
* Refresh-token rotation support
* Expired-session handling
* Logout
* Local session cleanup
* Session tests

⸻

11. User Profile

* Get current user
* Profile UI
* Update first name
* Update last name
* Preferred-language update
* Profile loading state
* Profile error state
* Delete-account UI
* Delete-account confirmation
* Delete-account API integration
* Local session cleanup after deletion
* Profile tests

⸻

12. Country & Currency

* Countries API integration
* Currencies API integration
* Localized country names
* Localized currency names
* Localized currency symbols
* Country flags
* Default currency selection
* Currency persistence through backend profile/settings
* Country/currency tests

Stable ISO codes must be used internally rather than localized display labels.

⸻

13. Vehicle Management

* Vehicle list UI
* Vehicle list API integration
* Vehicle details UI
* Vehicle details API integration
* Add vehicle UI
* Create vehicle API integration
* Edit vehicle UI
* Update vehicle API integration
* Update mileage
* Vehicle validation
* Vehicle empty state
* Vehicle loading state
* Vehicle error state
* Delete vehicle
* Delete confirmation
* Vehicle tests

⸻

14. Fuel Tracking

* Fuel history UI
* Fuel history API integration
* Add fuel record
* Fuel-record validation
* Fuel-record details
* Update fuel record
* Delete fuel record
* Fuel pagination
* Fuel sorting
* Fuel date filtering
* Fuel loading state
* Fuel empty state
* Fuel error state
* Fuel tests

⸻

15. Fuel Statistics

* Fuel statistics UI
* Fuel statistics API integration
* Distance-between-refills display
* Fuel efficiency display
* km/L display
* L/100km display
* Cost-per-kilometer display
* Monthly fuel-cost display
* Total fuel-cost display
* Average-efficiency display
* Multi-currency presentation
* Fuel-statistics tests

The frontend must display backend-calculated statistics rather than independently reproducing business calculations unless explicitly required for presentation.

⸻

16. Maintenance

* Maintenance history UI
* Maintenance history API integration
* Add maintenance record
* Maintenance validation
* Maintenance details
* Update maintenance
* Delete maintenance
* Maintenance sorting
* Maintenance date filtering
* Maintenance loading state
* Maintenance empty state
* Maintenance error state
* Maintenance tests

⸻

17. Expenses

* Expense history UI
* Expense API integration
* Add expense
* Expense validation
* Expense details
* Update expense
* Delete expense
* Expense sorting
* Expense date filtering
* Expense loading state
* Expense empty state
* Expense error state
* Expense tests

⸻

18. Reminders

* Reminder list UI
* Reminder API integration
* Add reminder
* Date-based reminder UI
* Mileage-based reminder UI
* Custom reminder UI
* Maintenance reminder UI
* License-expiration reminder UI
* Insurance-expiration reminder UI
* Update reminder
* Complete reminder
* Delete reminder
* Reminder loading state
* Reminder empty state
* Reminder error state
* Reminder tests

Reminder scheduling and notification-delivery decisions belong to the backend.

⸻

19. Device Management & Push Notifications

* Firebase configured for Android
* Firebase configured for iOS
* Notification permissions
* FCM token retrieval
* Device registration API
* FCM token update API
* Device deletion/logout integration
* Foreground notification handling
* Background notification handling
* Terminated-state notification handling
* Notification tap navigation
* Android notification verification
* iOS notification verification
* Physical-device FCM verification
* Notification tests where applicable

Do not mark real-device push notification verification complete based only on mocked tests.

⸻

20. Dashboard

* Vehicle dashboard UI
* Dashboard API integration
* Summary cards
* Fuel summary
* Maintenance summary
* Expense summary
* Reminder summary
* Dashboard loading state
* Dashboard empty state
* Dashboard error state
* Dashboard tests

⸻

21. Statistics

* General statistics UI
* General statistics API integration
* Maintenance statistics UI
* Maintenance statistics API integration
* Expense statistics UI
* Expense statistics API integration
* True Vehicle Cost UI
* True Vehicle Cost API integration
* Multi-currency presentation
* Statistics loading states
* Statistics empty states
* Statistics error states
* Statistics tests

⸻

22. Recent Vehicle Activity

* Recent activity UI
* Recent activity API integration
* Fuel activity presentation
* Maintenance activity presentation
* Expense activity presentation
* Completed-reminder presentation
* Activity empty state
* Activity loading state
* Activity error state
* Activity limit support
* Recent-activity tests

⸻

23. Common UI States

* Global loading component
* API loading builder
* Error-state component
* Empty-state component
* Retry behavior
* Confirmation dialog
* Common snackbar/toast behavior
* Common bottom-sheet behavior

Reuse these components instead of implementing feature-specific copies without reason.

⸻

24. Error Handling

The Flutter client must understand stable backend error codes.

Examples include:

VALIDATION_ERROR
UNAUTHORIZED
FORBIDDEN
INTERNAL_SERVER_ERROR
AUTH_INVALID_CREDENTIALS
AUTH_EMAIL_ALREADY_EXISTS
AUTH_TOKEN_EXPIRED
AUTH_INVALID_TOKEN
AUTH_INVALID_REFRESH_TOKEN
AUTH_GOOGLE_LOGIN_FAILED
AUTH_ACCOUNT_LINKING_REQUIRED
AUTH_EMAIL_NOT_VERIFIED
AUTH_EMAIL_ALREADY_VERIFIED
AUTH_OTP_INVALID
AUTH_OTP_EXPIRED
AUTH_OTP_ATTEMPTS_EXCEEDED
AUTH_OTP_RESEND_TOO_SOON
USER_NOT_FOUND
VEHICLE_NOT_FOUND
VEHICLE_ACCESS_DENIED
INVALID_VEHICLE_MILEAGE
FUEL_RECORD_NOT_FOUND
INVALID_FUEL_RECORD
MAINTENANCE_NOT_FOUND
EXPENSE_NOT_FOUND
REMINDER_NOT_FOUND

Checklist:

* Backend error model
* Stable error-code mapping
* Localized user-facing error presentation
* Validation-error presentation
* Authentication-error handling
* Unauthorized-session handling
* Retryable-error handling
* Unknown-error fallback
* Error-handling tests

Do not build application logic around localized backend message strings.

Use stable machine-readable error codes.

⸻

25. Pagination, Sorting & Filtering

* Shared pagination support
* Pagination loading state
* Pagination error handling
* Sorting support
* Date-range filtering
* Vehicle sorting integration
* Fuel sorting integration
* Maintenance sorting integration
* Expense sorting integration

Frontend parameters must conform to the backend allowlisted fields rather than sending arbitrary property names.

⸻

26. Security

* Secure authentication-token persistence
* Sensitive-data logging protection
* Session expiration handling
* Logout cleanup
* Delete-account cleanup
* Sensitive information excluded from debug logs
* Production logging reviewed
* Android production configuration reviewed
* iOS production configuration reviewed

Never log:

Passwords
OTP values
JWT access tokens
Refresh tokens
Google ID tokens
Firebase credentials
FCM tokens
Authorization headers
Sensitive user data

⸻

27. Testing

Every feature must receive appropriate automated coverage.

Required Test Types

Use where appropriate:

Unit Tests
Widget Tests
Bloc/Cubit Tests
Repository Tests
Mapper Tests
Validation Tests
Navigation Tests
Integration Tests

Checklist:

* Base-layer tests
* Theme tests
* Localization tests
* Splash tests
* Onboarding tests
* Authentication tests
* User-profile tests
* Vehicle tests
* Fuel tests
* Maintenance tests
* Expense tests
* Reminder tests
* Notification tests
* Dashboard tests
* Statistics tests
* Recent-activity tests
* Navigation tests
* Error-handling tests

Tests must validate meaningful behavior rather than merely increasing test count.

⸻

28. Code Quality

Codex must write clean, consistently formatted, production-readable Dart.

Rules:

Use standard Dart formatting.
Use const constructors where possible.
Prefer immutable widgets.
Keep widgets focused.
Keep business logic outside presentation widgets.
Avoid giant build methods.
Avoid duplicated code.
Avoid unnecessary abstractions.
Avoid unnecessary state management.
Avoid unnecessary packages.
Avoid magic colors.
Avoid hardcoded user-facing strings.
Avoid debugPrint/print in production code.
Remove unused imports.
Remove dead code.
Do not leave commented-out implementations.
Do not perform unrelated formatting-only changes.

⸻

29. Verification

Every completed task must run:

flutter analyze

Expected:

No issues introduced by the task.

Then:

flutter test

Expected:

All tests pass.

If the repository has pre-existing analyzer warnings or failing tests unrelated to the task, Codex must:

1. Identify them.
2. Verify they existed before the task where possible.
3. Report them explicitly.
4. Never falsely claim a clean build.
5. Never mark the requested feature complete if its own verification requirements are not satisfied.

⸻

30. Android Verification

* Debug Android build
* Physical Android-device verification
* Firebase Android configuration
* Notification permission behavior
* Production Android configuration
* Release Android build
* Android production verification

⸻

31. iOS Verification

* Debug iOS build
* Physical iPhone verification
* Firebase iOS configuration
* APNs configuration
* Notification permission behavior
* Production signing configuration
* Release iOS build
* iOS production verification

⸻

32. Final V1 Verification

* All V1 screens implemented
* All required Figma screens matched
* English application verified
* Arabic application verified
* RTL verified
* Authentication flow verified
* Onboarding flow verified
* Vehicle flow verified
* Fuel flow verified
* Maintenance flow verified
* Expense flow verified
* Reminder flow verified
* Push notifications verified
* Dashboard verified
* Statistics verified
* Recent activity verified
* Android physical-device verification
* iOS physical-device verification
* flutter analyze passes
* flutter test passes
* Android release build succeeds
* iOS release build succeeds
* Full V1 regression verification

⸻

V1 Main Feature Progress

* Project Foundation
* Architecture
* Base Layers
* Theme & Design System
* Localization
* Navigation
* Splash
* Onboarding
* Login
* Registration
* Email Verification
* Google Authentication
* Session Management
* User Profile
* Country & Currency
* Vehicle Management
* Fuel Tracking
* Fuel Statistics
* Maintenance
* Expenses
* Reminders
* Device Management
* Firebase Push Notifications
* Dashboard
* Statistics
* True Vehicle Cost
* Recent Vehicle Activity
* Full V1 Testing
* Android Production Verification
* iOS Production Verification

⸻

Not Included in V1

Do not implement the following unless the project owner explicitly changes scope:

AI Assistant
AI Insights
Receipt OCR
Receipt Scanner
PDF Reports
OBD-II Integration
Workshop Marketplace
Government Integration
Vehicle Sharing
Multiple Drivers
Payments
Subscriptions
Social Features
Explicit LOCAL ↔ Google Account Linking UI

⸻

README Progress Update Rule

This README is the progress tracker.

After EVERY task, Codex must inspect whether the task satisfies the Definition of Done.

If yes:

- [ ] Feature

becomes:

- [x] Feature

If no:

- [ ] Feature

MUST remain unchanged.

Codex may mark individual sub-items complete while leaving the parent feature incomplete.

Example:

# Onboarding
- [x] Onboarding 01 implemented from Figma
- [x] Onboarding 02 implemented from Figma
- [x] Onboarding 03 implemented from Figma
- [x] PageView navigation
- [x] Animated page indicator
- [ ] Onboarding completion persistence
- [ ] Arabic verification
- [x] Onboarding widget tests

Therefore:

# V1 Main Feature Progress
- [ ] Onboarding

must remain unchecked.

The parent may only become:

- [x] Onboarding

when every required onboarding requirement has actually been completed and verified.

Never mark a parent feature complete merely because its main screen exists.

⸻

Existing Implementation Rule

This README may initially contain unchecked items that are already implemented in the repository.

Codex must NOT blindly mark them complete.

When working in an area:

1. Inspect the existing implementation.
2. Inspect tests.
3. Verify behavior.
4. Run required verification.
5. Only then update the corresponding checklist items.

This allows the README to gradually become an accurate representation of the actual repository.

⸻

Backend Synchronization Rule

Before implementing a backend-connected feature:

1. Inspect the current backend API contract or supplied backend documentation.
2. Verify:
    * Endpoint.
    * HTTP method.
    * Request body.
    * Response body.
    * Authentication requirements.
    * Pagination.
    * Sorting.
    * Filtering.
    * Error codes.
3. Do not invent fields.
4. Do not reproduce backend calculations unnecessarily.
5. Do not depend on translated backend messages for application logic.

When the backend API changes, update the Flutter integration deliberately rather than silently guessing the new contract.

⸻

Figma Completion Rule

A Figma-backed UI task may only be marked complete when:

Correct Figma frame inspected
+
Correct assets used
+
Layout implemented
+
Typography implemented
+
Theme values used
+
Responsive behavior verified
+
English verified
+
Arabic / RTL verified where applicable
+
Interactions implemented
+
Tests pass

A screenshot that merely looks similar is not sufficient when functionality is part of the design.

⸻

Instructions for Codex

Before each task:

1. Read README.md completely.
2. Read BASE_LAYERS_README.md completely.
3. Read LOGIN_FEATURE_README.md completely.
4. Read architecture.md completely.
5. Inspect the current repository.
6. Inspect the relevant existing implementation.
7. Inspect the relevant Figma frame for UI work.
8. Identify the exact unfinished checklist item(s).

During implementation:

Follow existing architecture.
Reuse existing components.
Reuse ThemeData.
Use localization.
Respect RTL.
Use existing routing.
Use existing dependency injection.
Use existing networking.
Use existing API/error infrastructure.
Validate input.
Handle loading.
Handle success.
Handle empty state where applicable.
Handle errors.
Add meaningful tests.
Avoid unrelated changes.

After implementation:

Run relevant tests.
Run flutter analyze.
Run flutter test.
Fix task-related failures.
Verify behavior.
Review the final diff.
Update README.md.
Mark ONLY genuinely completed checklist items.
Do not start the next feature.

⸻

Permanent Development Workflow

READ PROJECT DOCUMENTATION
            ↓
INSPECT CURRENT CODE
            ↓
INSPECT FIGMA / API CONTRACT
            ↓
IDENTIFY UNFINISHED CHECKLIST ITEM
            ↓
IMPLEMENT
            ↓
ADD / UPDATE TESTS
            ↓
flutter analyze
            ↓
flutter test
            ↓
FIX FAILURES
            ↓
VERIFY FEATURE
            ↓
REVIEW DIFF
            ↓
UPDATE README.md
            ↓
MARK VERIFIED ITEMS COMPLETE
            ↓
STOP

⸻

Final Report Requirement

At the end of every task, Codex must report:

1. Requested feature/task.
2. Documentation files read.
3. Figma frame inspected, if applicable.
4. Backend APIs inspected, if applicable.
5. Files created.
6. Files modified.
7. Architecture/components reused.
8. Implementation completed.
9. Localization changes.
10. Tests added or updated.
11. flutter analyze result.
12. flutter test result.
13. Manual verification performed.
14. README checklist items changed to complete.
15. README checklist items intentionally left incomplete.
16. Remaining work for this feature.
17. Any known mismatch with Figma or backend behavior.

Never report a feature as complete if the README Definition of Done has not been satisfied.

⸻

Goal

The Sayarti Flutter V1 application should be:

Maintainable
Testable
Responsive
Localized
RTL-compatible
Consistent with Figma
Secure
Backend-driven
Production-oriented
Easy to extend

The priority is a stable, polished vehicle-management application, not maximizing the number of screens marked complete.
