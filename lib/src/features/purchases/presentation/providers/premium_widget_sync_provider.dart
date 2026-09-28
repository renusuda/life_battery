import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/is_premium_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'premium_widget_sync_provider.g.dart';

/// Mirrors the premium entitlement to the home screen widget.
///
/// keepAlive and watched at startup so the widget reflects the entitlement
/// after a purchase, a restore, or a reinstall. [isPremiumProvider] is
/// watched only as the re-run trigger for purchase events.
@Riverpod(keepAlive: true)
Future<void> premiumWidgetSync(Ref ref) async {
  await ref.watch(isPremiumProvider.future);
  await ref.read(entitlementsRepositoryProvider).syncEntitlementToWidget();
}
