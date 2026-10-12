// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_widget_sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Mirrors the premium entitlement to the home screen widget.
///
/// keepAlive and watched at startup so the widget reflects the entitlement
/// after a purchase, a restore, or a reinstall. [isPremiumProvider] is
/// watched only as the re-run trigger for purchase events.

@ProviderFor(premiumWidgetSync)
const premiumWidgetSyncProvider = PremiumWidgetSyncProvider._();

/// Mirrors the premium entitlement to the home screen widget.
///
/// keepAlive and watched at startup so the widget reflects the entitlement
/// after a purchase, a restore, or a reinstall. [isPremiumProvider] is
/// watched only as the re-run trigger for purchase events.

final class PremiumWidgetSyncProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Mirrors the premium entitlement to the home screen widget.
  ///
  /// keepAlive and watched at startup so the widget reflects the entitlement
  /// after a purchase, a restore, or a reinstall. [isPremiumProvider] is
  /// watched only as the re-run trigger for purchase events.
  const PremiumWidgetSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'premiumWidgetSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$premiumWidgetSyncHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return premiumWidgetSync(ref);
  }
}

String _$premiumWidgetSyncHash() => r'46154a4006ba860ac042e795ee6d39cd5ab157e4';
