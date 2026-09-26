// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_count_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(launchCountLocalDataSource)
const launchCountLocalDataSourceProvider =
    LaunchCountLocalDataSourceProvider._();

final class LaunchCountLocalDataSourceProvider
    extends
        $FunctionalProvider<
          LaunchCountLocalDataSource,
          LaunchCountLocalDataSource,
          LaunchCountLocalDataSource
        >
    with $Provider<LaunchCountLocalDataSource> {
  const LaunchCountLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'launchCountLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$launchCountLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<LaunchCountLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LaunchCountLocalDataSource create(Ref ref) {
    return launchCountLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LaunchCountLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LaunchCountLocalDataSource>(value),
    );
  }
}

String _$launchCountLocalDataSourceHash() =>
    r'a62ddad4bc344aaf4f8486616cabd9ca0ac80294';

@ProviderFor(launchCountRepository)
const launchCountRepositoryProvider = LaunchCountRepositoryProvider._();

final class LaunchCountRepositoryProvider
    extends
        $FunctionalProvider<
          LaunchCountRepository,
          LaunchCountRepository,
          LaunchCountRepository
        >
    with $Provider<LaunchCountRepository> {
  const LaunchCountRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'launchCountRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$launchCountRepositoryHash();

  @$internal
  @override
  $ProviderElement<LaunchCountRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LaunchCountRepository create(Ref ref) {
    return launchCountRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LaunchCountRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LaunchCountRepository>(value),
    );
  }
}

String _$launchCountRepositoryHash() =>
    r'b60f935df69e007709841e64be8120d70220b302';
