// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_review_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Exposed as a provider so tests can stand in for the store prompt.

@ProviderFor(inAppReview)
const inAppReviewProvider = InAppReviewProvider._();

/// Exposed as a provider so tests can stand in for the store prompt.

final class InAppReviewProvider
    extends $FunctionalProvider<InAppReview, InAppReview, InAppReview>
    with $Provider<InAppReview> {
  /// Exposed as a provider so tests can stand in for the store prompt.
  const InAppReviewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inAppReviewProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inAppReviewHash();

  @$internal
  @override
  $ProviderElement<InAppReview> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InAppReview create(Ref ref) {
    return inAppReview(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InAppReview value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InAppReview>(value),
    );
  }
}

String _$inAppReviewHash() => r'78a060a3d833457627bb7105c99787c0237d41b7';
