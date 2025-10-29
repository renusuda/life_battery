// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Deletes all data from the database.

@ProviderFor(deleteAllData)
const deleteAllDataProvider = DeleteAllDataProvider._();

/// Deletes all data from the database.

final class DeleteAllDataProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Deletes all data from the database.
  const DeleteAllDataProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteAllDataProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteAllDataHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return deleteAllData(ref);
  }
}

String _$deleteAllDataHash() => r'14b5c561dfe60776912811e88c7a99cc435a37e5';
