// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifespan_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lifespanLocalDataSource)
const lifespanLocalDataSourceProvider = LifespanLocalDataSourceProvider._();

final class LifespanLocalDataSourceProvider
    extends
        $FunctionalProvider<
          LifespanLocalDataSource,
          LifespanLocalDataSource,
          LifespanLocalDataSource
        >
    with $Provider<LifespanLocalDataSource> {
  const LifespanLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lifespanLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lifespanLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<LifespanLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LifespanLocalDataSource create(Ref ref) {
    return lifespanLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LifespanLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LifespanLocalDataSource>(value),
    );
  }
}

String _$lifespanLocalDataSourceHash() =>
    r'ea4943f18c1bbb2df724ea6b91f3c2c28f4f8d2b';

@ProviderFor(lifespanRepository)
const lifespanRepositoryProvider = LifespanRepositoryProvider._();

final class LifespanRepositoryProvider
    extends
        $FunctionalProvider<
          LifespanRepository,
          LifespanRepository,
          LifespanRepository
        >
    with $Provider<LifespanRepository> {
  const LifespanRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lifespanRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lifespanRepositoryHash();

  @$internal
  @override
  $ProviderElement<LifespanRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LifespanRepository create(Ref ref) {
    return lifespanRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LifespanRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LifespanRepository>(value),
    );
  }
}

String _$lifespanRepositoryHash() =>
    r'bed888acb926a56a59714249bab7ce31bf196083';
