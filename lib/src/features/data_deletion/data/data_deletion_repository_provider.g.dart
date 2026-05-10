// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_deletion_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dataDeletionLocalDataSource)
const dataDeletionLocalDataSourceProvider =
    DataDeletionLocalDataSourceProvider._();

final class DataDeletionLocalDataSourceProvider
    extends
        $FunctionalProvider<
          DataDeletionLocalDataSource,
          DataDeletionLocalDataSource,
          DataDeletionLocalDataSource
        >
    with $Provider<DataDeletionLocalDataSource> {
  const DataDeletionLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataDeletionLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataDeletionLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<DataDeletionLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DataDeletionLocalDataSource create(Ref ref) {
    return dataDeletionLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataDeletionLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataDeletionLocalDataSource>(value),
    );
  }
}

String _$dataDeletionLocalDataSourceHash() =>
    r'638aa35be113b0f983d22688f370ca287014438c';

@ProviderFor(dataDeletionRepository)
const dataDeletionRepositoryProvider = DataDeletionRepositoryProvider._();

final class DataDeletionRepositoryProvider
    extends
        $FunctionalProvider<
          DataDeletionRepository,
          DataDeletionRepository,
          DataDeletionRepository
        >
    with $Provider<DataDeletionRepository> {
  const DataDeletionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataDeletionRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataDeletionRepositoryHash();

  @$internal
  @override
  $ProviderElement<DataDeletionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DataDeletionRepository create(Ref ref) {
    return dataDeletionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataDeletionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataDeletionRepository>(value),
    );
  }
}

String _$dataDeletionRepositoryHash() =>
    r'9a01ee9023ff1be83ab953c0236bcd3d5b4fb1dc';
