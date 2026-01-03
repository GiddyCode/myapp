
# Application Blueprint

## Overview

This document outlines the architecture, features, and design of the Flutter application. The app is designed as a personal safety application with features for emergency alerts, community support, and trusted contacts.

## Architecture

The application is being refactored to follow a clean architecture pattern using `flutter_riverpod` for state management and dependency injection.

*   **Presentation Layer:** Contains the UI (widgets and screens) and the state management logic (Riverpod providers).
    *   **Screens:** Individual pages of the application.
    *   **Widgets:** Reusable UI components.
    *   **Providers:** Riverpod providers for managing UI state and theme.
*   **Domain Layer:** (To be developed) Will contain business logic, entities, and repository interfaces.
*   **Data Layer:** (To be developed) Will contain repository implementations and data sources (e.g., Firebase, local storage).

## Current Features & Design

*   **Onboarding:** A multi-page onboarding flow to introduce users to the app.
*   **Authentication:** Phone number based OTP verification.
*   **Home Screen:** A central dashboard providing access to core features:
    *   SOS Activation
    *   Community Feed
    *   Safety Status
    *   Trusted Contacts
*   **Theming:**
    *   Uses Material 3 with `ColorScheme.fromSeed`.
    *   Custom fonts via `google_fonts`.
    *   Support for Light/Dark mode toggling.
    *   Centralized theme data in `lib/theme/app_theme.dart`.
*   **Navigation:**
    *   Uses `go_router` for declarative routing.
    *   Routes are defined in `lib/router.dart`.

## Current Task: Refactor to Riverpod and Link Screens

### Plan

1.  **Add Riverpod Dependencies:** Add `flutter_riverpod`, `riverpod_annotation`, `build_runner`, and `riverpod_generator`.
2.  **Create Blueprint:** Create this `blueprint.md` file to document the project.
3.  **Refactor Theme Provider:**
    *   Convert the `ThemeProvider` from a `ChangeNotifier` to a Riverpod `NotifierProvider` using `riverpod_generator`.
    *   Create `lib/providers/theme_provider.dart`.
4.  **Update `main.dart`:**
    *   Remove the `ChangeNotifierProvider`.
    *   Wrap the root widget `MyApp` in a `ProviderScope`.
    *   Update `MyApp` to consume the new theme provider from Riverpod.
5.  **Link Home Screen Widgets:**
    *   Convert `HomeScreen` to a `ConsumerWidget`.
    *   Add `onPressed` or `onTap` handlers to the cards and buttons on the home screen.
    *   Use `context.go()` from `go_router` to navigate to the corresponding screens:
        *   "Activate SOS" button -> `/sos_activation`
        *   "SOS" card -> `/sos_history`
        *   "Community" card -> `/community_feed`
        *   "Safety Status" card -> `/safety_status`
        *   "Trusted Contacts" card -> `/trusted_contacts`
6.  **Code Generation:** Run `dart run build_runner build --delete-conflicting-outputs` to generate the necessary provider code.
7.  **Format Code:** Run `dart format .` to ensure code consistency.
8.  **Verification:** Check for analysis errors and ensure the UI navigation works as intended.
