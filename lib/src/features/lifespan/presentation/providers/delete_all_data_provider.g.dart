// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_all_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deleteAllData)
const deleteAllDataProvider = DeleteAllDataProvider._();

final class DeleteAllDataProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
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

String _$deleteAllDataHash() => r'028cf1a02449f3cc69733a16b158b4126c20dd1a';
