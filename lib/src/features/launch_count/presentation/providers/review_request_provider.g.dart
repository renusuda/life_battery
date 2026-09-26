// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReviewRequest)
const reviewRequestProvider = ReviewRequestProvider._();

final class ReviewRequestProvider
    extends $NotifierProvider<ReviewRequest, void> {
  const ReviewRequestProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reviewRequestProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reviewRequestHash();

  @$internal
  @override
  ReviewRequest create() => ReviewRequest();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$reviewRequestHash() => r'3f6c6ef31308b66b12622741eb4769994e113266';

abstract class _$ReviewRequest extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
