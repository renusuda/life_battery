// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shareApiDataSource)
const shareApiDataSourceProvider = ShareApiDataSourceProvider._();

final class ShareApiDataSourceProvider
    extends
        $FunctionalProvider<
          ShareApiDataSource,
          ShareApiDataSource,
          ShareApiDataSource
        >
    with $Provider<ShareApiDataSource> {
  const ShareApiDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shareApiDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shareApiDataSourceHash();

  @$internal
  @override
  $ProviderElement<ShareApiDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShareApiDataSource create(Ref ref) {
    return shareApiDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShareApiDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShareApiDataSource>(value),
    );
  }
}

String _$shareApiDataSourceHash() =>
    r'56f1515c65f9ce56ddc5095579cc8a3acd0d1a26';

@ProviderFor(shareRepository)
const shareRepositoryProvider = ShareRepositoryProvider._();

final class ShareRepositoryProvider
    extends
        $FunctionalProvider<ShareRepository, ShareRepository, ShareRepository>
    with $Provider<ShareRepository> {
  const ShareRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shareRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shareRepositoryHash();

  @$internal
  @override
  $ProviderElement<ShareRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShareRepository create(Ref ref) {
    return shareRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShareRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShareRepository>(value),
    );
  }
}

String _$shareRepositoryHash() => r'dd2e7f54eb294681e4fd6d44f9b71fa109e465da';
