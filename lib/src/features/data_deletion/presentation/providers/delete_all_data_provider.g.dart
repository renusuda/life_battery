// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_all_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeleteAllData)
const deleteAllDataProvider = DeleteAllDataProvider._();

final class DeleteAllDataProvider
    extends $NotifierProvider<DeleteAllData, void> {
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
  DeleteAllData create() => DeleteAllData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$deleteAllDataHash() => r'b30c6f0ff8db59b8b5ff55090114395df9ed9a4b';

abstract class _$DeleteAllData extends $Notifier<void> {
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
