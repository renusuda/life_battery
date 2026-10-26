// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_trial_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// keepAlive because [start] is fired and forgotten from the onboarding
/// step; an auto-disposed notifier would lose its ref before the sync.

@ProviderFor(WidgetTrial)
const widgetTrialProvider = WidgetTrialProvider._();

/// keepAlive because [start] is fired and forgotten from the onboarding
/// step; an auto-disposed notifier would lose its ref before the sync.
final class WidgetTrialProvider extends $NotifierProvider<WidgetTrial, void> {
  /// keepAlive because [start] is fired and forgotten from the onboarding
  /// step; an auto-disposed notifier would lose its ref before the sync.
  const WidgetTrialProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'widgetTrialProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$widgetTrialHash();

  @$internal
  @override
  WidgetTrial create() => WidgetTrial();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$widgetTrialHash() => r'435f1597014c928f76cfd184a36d17e662b96cf0';

/// keepAlive because [start] is fired and forgotten from the onboarding
/// step; an auto-disposed notifier would lose its ref before the sync.

abstract class _$WidgetTrial extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
