import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/data_deletion/presentation/pages/user_deleted_page.dart';
import 'package:life_battery/src/features/purchases/domain/purchase_outcome.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_bottom_sheet.dart';
import 'package:life_battery/src/features/settings/presentation/pages/settings_page.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/appearance_list_tile.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/delete_all_list_tile.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/widget_guide_bottom_sheet.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

import '../test_helpers/fake_purchases.dart';
import 'fake_app.dart';
import 'small_phone.dart';

void settingsScreenTests() {
  final l10n = lookupAppLocalizations(targetLocale);

  Future<void> pumpSettings(
    WidgetTester tester, {
    bool isPremium = false,
    FakePurchasesApiDataSource? purchases,
  }) async {
    await tester.pumpWidget(
      fakeApp(
        home: const SettingsPage(),
        isPremium: isPremium,
        purchases: purchases,
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> scrollToBottom(WidgetTester tester) async {
    await tester.scrollUntilVisible(find.byType(DeleteAllListTile), 100);
    await tester.pumpAndSettle();
  }

  Future<void> openPremiumSheet(WidgetTester tester) async {
    await tester.tap(find.text(l10n.premiumLabel));
    await tester.pumpAndSettle();
  }

  testScreen('Settings', (tester) async {
    await pumpSettings(tester);
    expectNoLayoutIssues(tester);

    await scrollToBottom(tester);
    expectNoLayoutIssues(tester);
  });

  testScreen('Settings when premium', (tester) async {
    await pumpSettings(tester, isPremium: true);

    expect(find.text(l10n.premiumPurchasedLabel), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Appearance menu', (tester) async {
    await pumpSettings(tester);
    await tester.tap(find.byType(AppearanceListTile));
    await tester.pumpAndSettle();

    expect(find.text(l10n.systemLabel), findsWidgets);
    expectNoLayoutIssues(tester);
  });

  testScreen('Delete all confirmation dialog', (tester) async {
    await pumpSettings(tester);
    await scrollToBottom(tester);
    await tester.tap(find.byType(DeleteAllListTile));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Widget guide sheet', (tester) async {
    await pumpSettings(tester);
    await tester.tap(find.text(l10n.widgetGuideLabel));
    await tester.pumpAndSettle();

    expect(find.byType(WidgetGuideBottomSheet), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Premium sheet with every plan', (tester) async {
    await pumpSettings(tester);
    await openPremiumSheet(tester);

    expect(find.text(l10n.monthlyPlanLabel), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Premium sheet when purchased', (tester) async {
    await pumpSettings(tester, isPremium: true);
    await openPremiumSheet(tester);

    expect(find.byType(PremiumBottomSheet), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Premium sheet when the store is unavailable', (tester) async {
    await pumpSettings(
      tester,
      purchases: longPricePurchases()..available = false,
    );
    await openPremiumSheet(tester);

    expect(find.text(l10n.storeUnavailableContent), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Premium sheet after a failed purchase', (tester) async {
    await pumpSettings(
      tester,
      purchases: longPricePurchases()..purchaseOutcome = PurchaseOutcome.error,
    );
    await openPremiumSheet(tester);
    await tester.tap(find.text(l10n.purchaseButtonLabel));
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byType(PremiumBottomSheet),
        matching: find.text(l10n.purchaseErrorContent),
      ),
      findsOneWidget,
    );
    expectNoLayoutIssues(tester);
  });

  testScreen('User deleted page', (tester) async {
    await tester.pumpWidget(fakeApp(home: const UserDeletedPage()));
    await tester.pumpAndSettle();

    expect(find.text(l10n.userDeletionSuccess), findsOneWidget);
    expectNoLayoutIssues(tester);
  });
}
