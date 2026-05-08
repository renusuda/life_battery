// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifespan_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localDatabase)
const localDatabaseProvider = LocalDatabaseProvider._();

final class LocalDatabaseProvider
    extends $FunctionalProvider<LocalDatabase, LocalDatabase, LocalDatabase>
    with $Provider<LocalDatabase> {
  const LocalDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localDatabaseHash();

  @$internal
  @override
  $ProviderElement<LocalDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalDatabase create(Ref ref) {
    return localDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalDatabase>(value),
    );
  }
}

String _$localDatabaseHash() => r'afc96f0851e573f7b590118a7a72bfd60a86cc50';

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
    r'051d52ada7ed951b3e693ab887a6b9a75f35feb7';

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
