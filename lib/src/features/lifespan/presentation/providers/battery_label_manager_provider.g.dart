// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_label_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The user-entered label above the battery. Null means the localized
/// default and an empty string hides the label.

@ProviderFor(BatteryLabelManager)
const batteryLabelManagerProvider = BatteryLabelManagerProvider._();

/// The user-entered label above the battery. Null means the localized
/// default and an empty string hides the label.
final class BatteryLabelManagerProvider
    extends $AsyncNotifierProvider<BatteryLabelManager, String?> {
  /// The user-entered label above the battery. Null means the localized
  /// default and an empty string hides the label.
  const BatteryLabelManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batteryLabelManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batteryLabelManagerHash();

  @$internal
  @override
  BatteryLabelManager create() => BatteryLabelManager();
}

String _$batteryLabelManagerHash() =>
    r'597e5ba94a7cb6080aca8733ca3b671db8a93dfb';

/// The user-entered label above the battery. Null means the localized
/// default and an empty string hides the label.

abstract class _$BatteryLabelManager extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
