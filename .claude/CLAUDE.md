# Life Battery

## Critical Rules

### 1. Code Organization

- Many small files over few large files
- Organize by layer: screens, models, providers, repositories
- Keep files under 200 lines (400 max)

### 2. Code Style

- No emojis in code, comments, or documentation
- Use Dart 3 patterns: switch expressions, records, pattern matching

### 3. Testing

- Unit tests for models, utils, and providers in `test/`
- Integration tests for user flows in `integration_test/`
- Run unit tests: `fvm flutter test`
- Run integration tests: `fvm flutter test integration_test/`

### 4. Security

- No hardcoded secrets

### 5. Localization

- All user-facing strings must be localized
- Always add to both `lib/l10n/app_en.arb` and `lib/l10n/app_ja.arb`
- Access via `AppLocalizations.of(context)`

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
