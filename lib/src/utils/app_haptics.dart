import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Wraps [HapticFeedback] so every haptic call is printed to the console in
/// debug builds. The simulator has no haptic engine, so the log is the only
/// way to confirm the call was made there.
class AppHaptics {
  const AppHaptics._();

  static Future<void> heavyImpact() {
    if (kDebugMode) debugPrint('[haptics] heavyImpact');
    return HapticFeedback.heavyImpact();
  }

  static Future<void> mediumImpact() {
    if (kDebugMode) debugPrint('[haptics] mediumImpact');
    return HapticFeedback.mediumImpact();
  }

  static Future<void> selectionClick() {
    if (kDebugMode) debugPrint('[haptics] selectionClick');
    return HapticFeedback.selectionClick();
  }
}
