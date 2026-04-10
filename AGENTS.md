# Critical Rules

## Code Organization

- Many small files over few large files
- Organize by layer: screens, models, providers, repositories
- Keep files under 200 lines (400 max)

## Code Style

- No emojis in code, comments, or documentation

## Testing

- Unit tests for models, utils, and providers in `test/`
- Integration tests for user flows in `integration_test/`
- Run unit tests: `fvm flutter test`
- Run integration tests: `fvm flutter test --timeout=3m integration_test/`

## Security

- No hardcoded secrets

## Localization

- All user-facing strings must be localized
- Always add to both `lib/l10n/app_en.arb` and `lib/l10n/app_ja.arb`
- Access via `AppLocalizations.of(context)`

# Code Generation

Generated files (`*.g.dart`, `*.freezed.dart`) should NOT be edited manually.

# Available Commands

```bash
# Install dependencies and generate localization files
fvm flutter pub get

# Run app
fvm flutter run

# Run all unit tests
fvm flutter test

# Run integration tests
fvm flutter test --timeout=3m integration_test/

# Analyze code
fvm flutter analyze

# Code generation
fvm dart run build_runner build --delete-conflicting-outputs

# Release build for iOS
fvm flutter build ipa

# Release build for Android
fvm flutter build appbundle
```
