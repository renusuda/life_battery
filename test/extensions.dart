import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
  /// Pumps frames until the [finder] finds at least one widget.
  ///
  /// Throws a [TestFailure] if the widget is not found within [timeout].
  ///
  /// Example:
  /// ```dart
  /// await tester.pumpUntilFound(find.byType(HomeScreen));
  /// ```
  Future<void> pumpUntilFound(
    Finder finder, {
    Duration timeout = const Duration(seconds: 5),
    Duration interval = const Duration(milliseconds: 50),
  }) async {
    if (finder.evaluate().isNotEmpty) return;

    final stopwatch = Stopwatch()..start();

    while (stopwatch.elapsed < timeout) {
      await pump(interval);

      if (finder.evaluate().isNotEmpty) return;
    }

    throw TestFailure(
      'pumpUntilFound timed out after $timeout waiting for: $finder',
    );
  }
}
