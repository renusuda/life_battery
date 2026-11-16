// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_count_increment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Counts this cold start once. A provider rather than a bare repository call
/// so the review request can wait for the count to include this launch.

@ProviderFor(launchCountIncrement)
const launchCountIncrementProvider = LaunchCountIncrementProvider._();

/// Counts this cold start once. A provider rather than a bare repository call
/// so the review request can wait for the count to include this launch.

final class LaunchCountIncrementProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Counts this cold start once. A provider rather than a bare repository call
  /// so the review request can wait for the count to include this launch.
  const LaunchCountIncrementProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'launchCountIncrementProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$launchCountIncrementHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return launchCountIncrement(ref);
  }
}

String _$launchCountIncrementHash() =>
    r'4df02079650851643b3dd40b6bb5811f1932975b';
