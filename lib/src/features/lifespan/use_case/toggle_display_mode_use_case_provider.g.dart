// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_display_mode_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(toggleDisplayModeUseCase)
const toggleDisplayModeUseCaseProvider = ToggleDisplayModeUseCaseProvider._();

final class ToggleDisplayModeUseCaseProvider
    extends
        $FunctionalProvider<
          ToggleDisplayModeUseCase,
          ToggleDisplayModeUseCase,
          ToggleDisplayModeUseCase
        >
    with $Provider<ToggleDisplayModeUseCase> {
  const ToggleDisplayModeUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleDisplayModeUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleDisplayModeUseCaseHash();

  @$internal
  @override
  $ProviderElement<ToggleDisplayModeUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ToggleDisplayModeUseCase create(Ref ref) {
    return toggleDisplayModeUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleDisplayModeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleDisplayModeUseCase>(value),
    );
  }
}

String _$toggleDisplayModeUseCaseHash() =>
    r'17a2a55364fbf8f77dda091e7025922003ca88a2';
