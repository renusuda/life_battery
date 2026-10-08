import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_progress_state_provider.dart';
import 'package:life_battery/src/features/share/data/share_repository_provider.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_icon_button.dart';

import '../../../../../test_helpers/fake_share.dart';
import '../../../../../test_helpers/share_test_pump.dart';
import '../../../../../test_helpers/test_app.dart';

void main() {
  late FakeShareApiDataSource fakeShare;

  LifespanProgressState buildState({
    bool isInitialUser = false,
    bool isPercentageMode = true,
  }) {
    return (
      isInitialUser: isInitialUser,
      lifespanRange: LifespanRange(
        birthDate: DateTime.now().subtract(const Duration(days: 365 * 30)),
        idealAge: 80,
      ),
      hasLongPressedBattery: true,
      isPercentageMode: isPercentageMode,
    );
  }

  Widget buildButton(LifespanProgressState state) {
    return ProviderScope(
      overrides: [
        shareApiDataSourceProvider.overrideWithValue(fakeShare),
        lifespanProgressStateProvider.overrideWith((ref) async => state),
      ],
      child: const TestApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: AppBarHost(),
          ),
        ),
      ),
    );
  }

  setUp(() {
    fakeShare = FakeShareApiDataSource();
  });

  testWidgets('Hides the button for an initial user', (tester) async {
    await tester.pumpWidget(buildButton(buildState(isInitialUser: true)));
    await tester.pumpAndSettle();

    expect(find.byType(IconButton), findsNothing);
  });

  testWidgets('Shares the card with the percentage message', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildButton(buildState()));
    await tester.pumpAndSettle();

    await tester.tapAndAwaitShare(find.byType(IconButton));

    expect(fakeShare.sharedImages, hasLength(1));
    expect(fakeShare.sharedTexts.single, contains('% of my life left.'));
  });

  testWidgets('Shares in days mode too', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(
      buildButton(buildState(isPercentageMode: false)),
    );
    await tester.pumpAndSettle();

    await tester.tapAndAwaitShare(find.byType(IconButton));

    expect(fakeShare.sharedImages, hasLength(1));
  });
}

class AppBarHost extends StatelessWidget {
  const AppBarHost({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: const [ShareIconButton()]);
  }
}
