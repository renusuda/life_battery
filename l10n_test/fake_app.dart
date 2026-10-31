import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/data/launch_count_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/presentation/providers/in_app_review_provider.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/display_mode_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/has_long_pressed_battery_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/purchases_repository_provider.dart';
import 'package:life_battery/src/features/settings/presentation/providers/app_theme_mode_provider.dart';
import 'package:life_battery/src/features/share/data/share_repository_provider.dart';
import 'package:life_battery/src/features/share/domain/share_outcome.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../test_helpers/fake_analytics.dart';
import '../test_helpers/fake_entitlements.dart';
import '../test_helpers/fake_in_app_review.dart';
import '../test_helpers/fake_launch_count.dart';
import '../test_helpers/fake_purchases.dart';
import '../test_helpers/fake_share.dart';
import '../test_helpers/test_app.dart';

/// Born in 2000 with the maximum ideal age, so the remaining days take five
/// digits and the ideal age three.
LifespanRange get longLifespanRange =>
    LifespanRange(birthDate: DateTime(2000), idealAge: 150);

/// Dong prices are among the longest price strings in the stores.
FakePurchasesApiDataSource longPricePurchases() {
  return FakePurchasesApiDataSource(
    lifetimeProduct: const StoreProduct(
      'premium_lifetime',
      'Removes ads and unlocks the widget',
      'Premium',
      129000,
      '129.000 ₫',
      'VND',
    ),
    monthlyProduct: const StoreProduct(
      'premium_monthly',
      'Removes ads and unlocks the widget',
      'Premium Monthly',
      49000,
      '49.000 ₫',
      'VND',
    ),
    lifetimeSupportProduct: const StoreProduct(
      'premium_lifetime_support',
      'Removes ads, unlocks the widget, and supports development',
      'Premium Supporter',
      379000,
      '379.000 ₫',
      'VND',
    ),
  );
}

/// Wraps [home] with every data source faked, so any screen can be pumped.
Widget fakeApp({
  required Widget home,
  bool isInitialUser = false,
  bool hasLongPressedBattery = false,
  bool isPercentageMode = true,
  bool isPremium = false,
  FakePurchasesApiDataSource? purchases,
}) {
  return ProviderScope(
    overrides: [
      analyticsApiDataSourceProvider.overrideWithValue(
        FakeAnalyticsApiDataSource(),
      ),
      entitlementsLocalDataSourceProvider.overrideWithValue(
        FakeEntitlementsLocalDataSource(isPremium: isPremium),
      ),
      entitlementsHomeWidgetDataSourceProvider.overrideWithValue(
        FakeEntitlementsHomeWidgetDataSource(),
      ),
      purchasesApiDataSourceProvider.overrideWithValue(
        purchases ?? longPricePurchases(),
      ),
      launchCountLocalDataSourceProvider.overrideWithValue(
        FakeLaunchCountLocalDataSource(),
      ),
      inAppReviewProvider.overrideWithValue(FakeInAppReview()),
      // Dismissed keeps the share card open instead of closing it.
      shareApiDataSourceProvider.overrideWithValue(
        FakeShareApiDataSource(outcome: ShareOutcome.dismissed),
      ),
      isInitialUserProvider.overrideWith(
        () => FakeIsInitialUser(isInitialUser: isInitialUser),
      ),
      lifespanRangeManagerProvider.overrideWith(FakeLifespanRangeManager.new),
      hasLongPressedBatteryProvider.overrideWith(
        () => FakeHasLongPressedBattery(value: hasLongPressedBattery),
      ),
      displayModeManagerProvider.overrideWith(
        () => FakeDisplayModeManager(isPercentageMode: isPercentageMode),
      ),
      appThemeModeProvider.overrideWith(FakeAppThemeMode.new),
    ],
    child: TestApp(home: home),
  );
}

class FakeLifespanRangeManager extends LifespanRangeManager {
  @override
  Future<LifespanRange> build() async => longLifespanRange;

  @override
  Future<void> updateLifespanRange({
    required DateTime birthDate,
    required int idealAge,
  }) async {
    state = AsyncData(LifespanRange(birthDate: birthDate, idealAge: idealAge));
  }
}

class FakeIsInitialUser extends IsInitialUser {
  FakeIsInitialUser({required this.isInitialUser});

  bool isInitialUser;

  @override
  Future<bool> build() async => isInitialUser;

  @override
  Future<void> updateUserIsNotInitialUser() async {
    isInitialUser = false;
    state = const AsyncData(false);
  }
}

class FakeHasLongPressedBattery extends HasLongPressedBattery {
  FakeHasLongPressedBattery({required this.value});

  final bool value;

  @override
  Future<bool> build() async => value;

  @override
  Future<void> updateHasLongPressedBattery() async {
    state = const AsyncData(true);
  }
}

class FakeDisplayModeManager extends DisplayModeManager {
  FakeDisplayModeManager({required this.isPercentageMode});

  final bool isPercentageMode;

  @override
  Future<bool> build() async => isPercentageMode;

  @override
  void toggle() {
    state = AsyncData(!(state.value ?? true));
  }
}

class FakeAppThemeMode extends AppThemeMode {
  @override
  Future<ThemeMode> build() async => ThemeMode.system;

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    state = AsyncData(themeMode);
  }
}
