// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_mode_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages whether the battery is displayed as a percentage or as remaining
/// days.

@ProviderFor(DisplayModeManager)
const displayModeManagerProvider = DisplayModeManagerProvider._();

/// Manages whether the battery is displayed as a percentage or as remaining
/// days.
final class DisplayModeManagerProvider
    extends $AsyncNotifierProvider<DisplayModeManager, bool> {
  /// Manages whether the battery is displayed as a percentage or as remaining
  /// days.
  const DisplayModeManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'displayModeManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$displayModeManagerHash();

  @$internal
  @override
  DisplayModeManager create() => DisplayModeManager();
}

String _$displayModeManagerHash() =>
    r'9b35e9c1852dcdf26ad17991fb61d55f880d6678';

/// Manages whether the battery is displayed as a percentage or as remaining
/// days.

abstract class _$DisplayModeManager extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
