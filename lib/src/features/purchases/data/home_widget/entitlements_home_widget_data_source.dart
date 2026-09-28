// Kept as a data source interface to match the layer's structure and to
// allow a fake in tests.
// ignore: one_member_abstracts
abstract interface class EntitlementsHomeWidgetDataSource {
  /// [expiresAt] is null when the unlock never expires or is locked.
  Future<void> syncWidgetUnlock({
    required bool isUnlocked,
    required DateTime? expiresAt,
  });
}
