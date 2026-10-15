import 'package:life_battery/src/features/purchases/data/home_widget/entitlements_home_widget_data_source.dart';
import 'package:life_battery/src/features/purchases/data/local/entitlements_local_data_source.dart';

class EntitlementsRepository {
  const EntitlementsRepository({
    required EntitlementsLocalDataSource localDataSource,
    required EntitlementsHomeWidgetDataSource homeWidgetDataSource,
  }) : _localDataSource = localDataSource,
       _homeWidgetDataSource = homeWidgetDataSource;

  final EntitlementsLocalDataSource _localDataSource;
  final EntitlementsHomeWidgetDataSource _homeWidgetDataSource;

  /// Decides whether the user is entitled to the premium features
  /// (ad removal and the home screen widget).
  Future<bool> isPremium() async {
    final entitlement = await _localDataSource.getEntitlement();
    return entitlement.isActive(DateTime.now());
  }

  Future<bool> markPremiumPurchased() async {
    final entitlement = await _localDataSource.getEntitlement();
    if (entitlement.hasLifetime) return false;

    await _localDataSource.markLifetimePurchased();
    return true;
  }

  Future<bool> markPremiumSubscribed({required DateTime expiresAt}) async {
    // Never shorten a known expiry: the store may redeliver an older
    // transaction, and it must not rewind the expiry written by a newer one.
    final entitlement = await _localDataSource.getEntitlement();
    final currentExpiresAt = entitlement.subscriptionExpiresAt;
    if (currentExpiresAt != null && !expiresAt.isAfter(currentExpiresAt)) {
      return false;
    }

    await _localDataSource.markSubscribedUntil(expiresAt);
    return true;
  }

  /// Pushes the premium entitlement to the home screen widget.
  ///
  /// The expiry is sent along so the widget locks itself even when the
  /// app is never opened again after a cancellation.
  Future<void> syncEntitlementToWidget() async {
    final entitlement = await _localDataSource.getEntitlement();
    final isUnlocked = entitlement.isActive(DateTime.now());
    return _homeWidgetDataSource.syncWidgetUnlock(
      isUnlocked: isUnlocked,
      expiresAt: isUnlocked && !entitlement.hasLifetime
          ? entitlement.subscriptionExpiresAt
          : null,
    );
  }
}
