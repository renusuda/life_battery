enum PurchaseOutcome {
  completed,
  canceled,

  /// The purchase awaits approval (Ask to Buy); the entitlement arrives
  /// later through the entitlement stream.
  pending,

  error,
}
