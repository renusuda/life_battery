# Life Battery

## Project Overview

- iOS / Android cross-platform mobile app.
- Visualizes remaining life as a battery percentage.
- Built with Flutter + Riverpod + Freezed + sqflite + Firebase (Analytics/Crashlytics).
- Supports English and Japanese localization.

## Critical Rules

### 1. Code Organization

- Many small files over few large files
- Organize by layer: screens, models, providers, repositories
- Keep files under 200 lines (400 max)

### 2. Code Style

- No emojis in code, comments, or documentation
- Follow `very_good_analysis` lint rules strictly
- Use Dart 3 patterns: switch expressions, records, pattern matching

### 3. State Management

- Riverpod for shared state management
- setState for local UI state

### 4. Testing

- Unit tests for models, utils, and providers in `test/`
- Integration tests for user flows in `integration_test/`
- Run unit tests: `fvm flutter test`
- Run integration tests: `fvm flutter test integration_test/`

### 5. Security

- No hardcoded secrets

### 6. Localization

- All user-facing strings must be localized
- Always add to both `lib/l10n/app_en.arb` and `lib/l10n/app_ja.arb`
- Access via `AppLocalizations.of(context)`

## File Structure

```
lib/
|-- l10n/                 # Localization (ARB files + generated)
|-- models/               # Data models (Freezed)
|-- providers/            # Riverpod providers (with code generation)
|-- repositories/         # Data access layer (sqflite)
|-- screens/              # Full-page screens
|-- utils/                # Utility functions and extensions
|-- widgets/              # Reusable UI components
|-- firebase_options.dart # Auto-generated Firebase config
|-- main.dart             # App entry point
|-- theme.dart            # App theme definitions
test/                     # Unit tests (mirrors lib/ structure)
integration_test/         # Integration/E2E tests
```

## Code Generation

This project uses `build_runner` for code generation (Freezed, Riverpod, JSON serialization).

```bash
# Run code generation
fvm dart run build_runner build --delete-conflicting-outputs

# Watch mode
fvm dart run build_runner watch --delete-conflicting-outputs
```

Generated files (`*.g.dart`, `*.freezed.dart`) should NOT be edited manually.

## Available Commands

```bash
# Install dependencies and generate localization files
fvm flutter pub get

# Run app
fvm flutter run

# Run all unit tests
fvm flutter test

# Run integration tests
fvm flutter test integration_test/

# Analyze code
fvm flutter analyze

# Code generation
fvm dart run build_runner build --delete-conflicting-outputs

# Release build for iOS
fvm flutter build ipa

# Release build for Android
fvm flutter build appbundle
```
