class StoreEntitlement {
  const StoreEntitlement({required this.productId, this.expiresAt});

  final String productId;

  /// Null for the lifetime purchase.
  final DateTime? expiresAt;
}
