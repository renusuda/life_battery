// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'has_long_pressed_battery.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HasLongPressedBattery)
const hasLongPressedBatteryProvider = HasLongPressedBatteryProvider._();

final class HasLongPressedBatteryProvider
    extends $AsyncNotifierProvider<HasLongPressedBattery, bool> {
  const HasLongPressedBatteryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasLongPressedBatteryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasLongPressedBatteryHash();

  @$internal
  @override
  HasLongPressedBattery create() => HasLongPressedBattery();
}

String _$hasLongPressedBatteryHash() =>
    r'0ed0d345680d26196332dad3f5bf02c375029a5e';

abstract class _$HasLongPressedBattery extends $AsyncNotifier<bool> {
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
