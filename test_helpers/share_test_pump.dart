import 'package:flutter_test/flutter_test.dart';

extension ShareTestPump on WidgetTester {
  /// The image encoder only completes under [runAsync].
  Future<void> tapAndAwaitShare(Finder finder) async {
    await runAsync(() async {
      await tap(finder);
      await pumpAndSettle();
      await Future<void>.delayed(const Duration(milliseconds: 500));
      await pumpAndSettle();
    });
  }
}
