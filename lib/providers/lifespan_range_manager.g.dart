// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifespan_range_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// lifespan range manager

@ProviderFor(LifespanRangeManager)
const lifespanRangeManagerProvider = LifespanRangeManagerProvider._();

/// lifespan range manager
final class LifespanRangeManagerProvider
    extends $AsyncNotifierProvider<LifespanRangeManager, LifespanRange> {
  /// lifespan range manager
  const LifespanRangeManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lifespanRangeManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lifespanRangeManagerHash();

  @$internal
  @override
  LifespanRangeManager create() => LifespanRangeManager();
}

String _$lifespanRangeManagerHash() =>
    r'b1a1e8399486a74b3e194b4d5389b907d4db4669';

/// lifespan range manager

abstract class _$LifespanRangeManager extends $AsyncNotifier<LifespanRange> {
  FutureOr<LifespanRange> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LifespanRange>, LifespanRange>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LifespanRange>, LifespanRange>,
              AsyncValue<LifespanRange>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
