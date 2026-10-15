import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/purchases_repository_provider.dart';
import 'package:life_battery/src/features/purchases/domain/paywall_source.dart';
import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:life_battery/src/features/purchases/domain/purchase_outcome.dart';
import 'package:life_battery/src/features/purchases/domain/store_entitlement.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_bottom_sheet.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_list_tile.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_plan_card.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../../test_helpers/fake_analytics.dart';
import '../../../../../test_helpers/fake_entitlements.dart';
import '../../../../../test_helpers/fake_purchases.dart';
import '../../../../../test_helpers/test_app.dart';

void main() {
  late FakePurchasesApiDataSource fakeApi;
  late FakeEntitlementsLocalDataSource fakeEntitlements;
  late FakeAnalyticsApiDataSource fakeAnalytics;

  Widget buildTile() {
    return ProviderScope(
      overrides: [
        purchasesApiDataSourceProvider.overrideWithValue(fakeApi),
        entitlementsLocalDataSourceProvider.overrideWithValue(
          fakeEntitlements,
        ),
        analyticsApiDataSourceProvider.overrideWithValue(fakeAnalytics),
      ],
      child: const TestApp(
        home: Scaffold(body: PremiumListTile()),
      ),
    );
  }

  setUp(() {
    fakeApi = FakePurchasesApiDataSource();
    fakeEntitlements = FakeEntitlementsLocalDataSource();
    fakeAnalytics = FakeAnalyticsApiDataSource();
  });

  Future<void> openSheet(WidgetTester tester, {String locale = 'en'}) async {
    tester.platformDispatcher.localesTestValue = [Locale(locale)];
    await tester.pumpWidget(buildTile());
    await tester.pumpAndSettle();

    await tester.tap(find.text(locale == 'ja' ? 'プレミアム' : 'Premium'));
    await tester.pumpAndSettle();
  }

  // The monthly card sits below the fold of the 800x600 test window, under
  // the purchase button.
  Future<void> tapMonthly(WidgetTester tester) async {
    await tester.ensureVisible(find.text('Monthly'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Monthly'));
  }

  testWidgets(
    'Disables the purchase on the sheet when the store is unavailable',
    (tester) async {
      fakeApi.available = false;

      await openSheet(tester);

      expect(find.text('The store is currently unavailable.'), findsOneWidget);
      final button = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Purchase'),
      );
      expect(button.onPressed, isNull);
    },
  );

  testWidgets(
    'Disables the purchase on the sheet when no product can be fetched',
    (tester) async {
      fakeApi
        ..lifetimeProduct = null
        ..monthlyProduct = null;

      await openSheet(tester);

      expect(find.text('The store is currently unavailable.'), findsOneWidget);
    },
  );

  testWidgets(
    'Shows a Japanese notice on the sheet when the store is unavailable',
    (tester) async {
      fakeApi.available = false;

      await openSheet(tester, locale: 'ja');

      expect(find.text('現在ストアを利用できません。'), findsOneWidget);
    },
  );

  testWidgets('Requests the restore from the bottom sheet', (tester) async {
    fakeApi.available = false;

    await openSheet(tester);

    await tester.tap(find.text('Restore purchases'));
    await tester.pumpAndSettle();

    expect(fakeApi.restoreCallCount, 1);
  });

  testWidgets('Opens the bottom sheet with the purchase button when tapped', (
    tester,
  ) async {
    await openSheet(tester);

    expect(find.text('Make the most of your time'), findsOneWidget);
    expect(find.text('5 stars'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsNWidgets(5));
    expect(find.text('What you get with Premium'), findsOneWidget);
    expect(find.text('Hides all ads', findRichText: true), findsOneWidget);
    expect(
      find.text('Check at a glance with the widget', findRichText: true),
      findsOneWidget,
    );
    expect(find.text('Monthly'), findsOneWidget);
    expect(find.text(r'$0.99/mo'), findsOneWidget);
    expect(find.text('Cancel anytime'), findsOneWidget);
    expect(find.text('One-time purchase'), findsOneWidget);
    expect(find.text('Best value'), findsOneWidget);
    expect(find.text(r'$1.00'), findsOneWidget);
    expect(find.text('Pay once, use forever'), findsOneWidget);
    expect(find.text('Purchase'), findsOneWidget);
    expect(fakeApi.boughtProducts, isEmpty);
  });

  testWidgets('Shows the legal links on the bottom sheet', (tester) async {
    await openSheet(tester);

    expect(find.text('Terms of Use'), findsOneWidget);
    expect(find.text('Privacy policy'), findsOneWidget);
  });

  testWidgets('Shows the legal links on the Japanese bottom sheet', (
    tester,
  ) async {
    await openSheet(tester, locale: 'ja');

    expect(find.text('利用規約'), findsOneWidget);
    expect(find.text('プライバシーポリシー'), findsOneWidget);
  });

  testWidgets('Shows the dollar price on the bottom sheet', (tester) async {
    fakeApi.lifetimeProduct = const StoreProduct(
      'premium_lifetime',
      'Removes ads and unlocks the widget',
      'Premium',
      6.99,
      r'$6.99',
      'USD',
    );

    await openSheet(tester);

    expect(find.text(r'$6.99'), findsOneWidget);
  });

  testWidgets('Shows the yen price on the Japanese bottom sheet', (
    tester,
  ) async {
    fakeApi.lifetimeProduct = const StoreProduct(
      'premium_lifetime',
      'Removes ads and unlocks the widget',
      'Premium',
      1000,
      '¥1,000',
      'JPY',
    );

    await openSheet(tester, locale: 'ja');

    expect(find.text('¥1,000'), findsOneWidget);
    expect(find.text('買い切り'), findsOneWidget);
    expect(find.text('おすすめ'), findsOneWidget);
    expect(find.text('一度の支払いでずっと使えます'), findsOneWidget);
    expect(find.text('月額'), findsOneWidget);
    expect(find.text(r'$0.99/月'), findsOneWidget);
    expect(find.text('いつでも解約できます'), findsOneWidget);
  });

  testWidgets('Shows only the one-time plan when the monthly plan is missing', (
    tester,
  ) async {
    fakeApi.monthlyProduct = null;

    await openSheet(tester);

    expect(find.text('Monthly'), findsNothing);
    expect(find.text('Pay once, use forever'), findsOneWidget);
  });

  testWidgets('Selects the one-time plan by default', (tester) async {
    await openSheet(tester);

    final cards = tester
        .widgetList<PremiumPlanCard>(find.byType(PremiumPlanCard))
        .toList();
    expect(cards.map((card) => card.isSelected), [true, false]);
  });

  testWidgets('Switches to the monthly plan on the bottom sheet', (
    tester,
  ) async {
    await openSheet(tester);

    await tapMonthly(tester);
    await tester.pumpAndSettle();

    final cards = tester
        .widgetList<PremiumPlanCard>(find.byType(PremiumPlanCard))
        .toList();
    expect(cards.map((card) => card.isSelected), [false, true]);
  });

  testWidgets('Purchases the monthly plan from the bottom sheet', (
    tester,
  ) async {
    await openSheet(tester);

    await tapMonthly(tester);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Purchase'));
    await tester.pumpAndSettle();

    expect(fakeApi.boughtProducts, [fakeApi.monthlyProduct]);
  });

  testWidgets('Requests the purchase from the bottom sheet button', (
    tester,
  ) async {
    await openSheet(tester);

    await tester.tap(find.text('Purchase'));
    await tester.pumpAndSettle();

    expect(fakeApi.boughtProducts, [fakeApi.lifetimeProduct]);
  });

  testWidgets('Shows an error when the purchase request fails', (
    tester,
  ) async {
    fakeApi.purchaseOutcome = PurchaseOutcome.error;

    await openSheet(tester);

    await tester.tap(find.text('Purchase'));
    await tester.pumpAndSettle();

    // The settings tile behind the sheet shows the same message as a
    // snack bar, so the lookup is scoped to the sheet.
    expect(
      find.descendant(
        of: find.byType(PremiumBottomSheet),
        matching: find.text(
          'The purchase could not be completed. Please try again.',
        ),
      ),
      findsOneWidget,
    );
  });

  testWidgets('Logs purchase_complete after purchasing from the sheet', (
    tester,
  ) async {
    await openSheet(tester);

    await tester.tap(find.text('Purchase'));
    await tester.pumpAndSettle();

    expect(fakeAnalytics.purchaseCompletes, [PremiumPlan.lifetime]);
  });

  testWidgets('Does not log purchase_complete on an entitlement update', (
    tester,
  ) async {
    await openSheet(tester);

    fakeApi.controller.add(
      StoreEntitlement(productId: PremiumPlan.lifetime.productId),
    );
    await tester.pumpAndSettle();

    expect(fakeAnalytics.purchaseCompletes, isEmpty);
  });

  testWidgets('Closes the bottom sheet after a purchase', (tester) async {
    await openSheet(tester);

    await tester.tap(find.text('Purchase'));
    await tester.pumpAndSettle();

    expect(find.text('Purchase'), findsNothing);
    expect(find.text('Purchased'), findsOneWidget);
  });

  testWidgets('Closes the bottom sheet on an entitlement update', (
    tester,
  ) async {
    await openSheet(tester);

    fakeApi.controller.add(
      StoreEntitlement(productId: PremiumPlan.lifetime.productId),
    );
    await tester.pumpAndSettle();

    expect(find.text('Purchase'), findsNothing);
    expect(find.text('Purchased'), findsOneWidget);
  });

  testWidgets('Closes the bottom sheet after a restore', (tester) async {
    fakeApi.restoredEntitlement = StoreEntitlement(
      productId: PremiumPlan.lifetime.productId,
    );

    await openSheet(tester);

    await tester.tap(find.text('Restore purchases'));
    await tester.pumpAndSettle();

    expect(find.text('Purchase'), findsNothing);
    expect(find.text('Purchased'), findsOneWidget);
  });

  testWidgets('Logs the paywall view once when the sheet is opened', (
    tester,
  ) async {
    await openSheet(tester);

    // Rebuild the sheet to confirm the event does not fire again.
    await tapMonthly(tester);
    await tester.pumpAndSettle();

    expect(fakeAnalytics.paywallViews, [PaywallSource.settings]);
  });

  testWidgets('Logs the purchase start with the selected plan', (
    tester,
  ) async {
    // A canceled purchase keeps the sheet open for the second attempt.
    fakeApi.purchaseOutcome = PurchaseOutcome.canceled;

    await openSheet(tester);

    await tester.tap(find.text('Purchase'));
    await tester.pumpAndSettle();

    expect(fakeAnalytics.purchaseStarts, [PremiumPlan.lifetime]);

    await tapMonthly(tester);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Purchase'));
    await tester.pumpAndSettle();

    expect(fakeAnalytics.purchaseStarts, [
      PremiumPlan.lifetime,
      PremiumPlan.monthly,
    ]);
  });

  testWidgets('Shows the Japanese bottom sheet when tapped', (tester) async {
    await openSheet(tester, locale: 'ja');

    expect(find.text('残りの時間をもっと大切に'), findsOneWidget);
    expect(find.text('5 stars'), findsOneWidget);
    expect(find.text('プレミアムでできること'), findsOneWidget);
    expect(find.text('すべての広告を非表示', findRichText: true), findsOneWidget);
    expect(
      find.text('ウィジェットでひと目でチェック', findRichText: true),
      findsOneWidget,
    );
    expect(find.text('購入'), findsOneWidget);
  });

  testWidgets(
    'Opens the sheet with a disabled purchased button when entitled',
    (tester) async {
      fakeEntitlements.isPremium = true;

      await openSheet(tester);

      expect(find.text('What you get with Premium'), findsOneWidget);
      final button = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Purchased'),
      );
      expect(button.onPressed, isNull);
      expect(fakeApi.boughtProducts, isEmpty);
    },
  );
}
