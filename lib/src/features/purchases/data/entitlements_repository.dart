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

  /// Unlocks the widget until the end of the local day so the user can try
  /// the one just added during onboarding. Granted once per install;
  /// skipped when premium is already held.
  Future<bool> startWidgetTrialIfNeeded({required DateTime now}) async {
    final entitlement = await _localDataSource.getEntitlement();
    if (entitlement.isActive(now) || entitlement.widgetTrialExpiresAt != null) {
      return false;
    }

    final endOfToday = DateTime(now.year, now.month, now.day + 1);
    await _localDataSource.markWidgetTrialUntil(endOfToday);
    return true;
  }

  /// Pushes the widget unlock to the home screen widget.
  ///
  /// The expiry is sent along so the widget locks itself even when the
  /// app is never opened again after a cancellation or a trial.
  Future<void> syncEntitlementToWidget() async {
    final entitlement = await _localDataSource.getEntitlement();
    final now = DateTime.now();
    return _homeWidgetDataSource.syncWidgetUnlock(
      isUnlocked: entitlement.isWidgetUnlocked(now),
      expiresAt: entitlement.widgetUnlockExpiresAt(now),
    );
  }
}
