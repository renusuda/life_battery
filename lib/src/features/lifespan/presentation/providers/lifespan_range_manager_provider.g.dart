// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifespan_range_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LifespanRangeManager)
const lifespanRangeManagerProvider = LifespanRangeManagerProvider._();

final class LifespanRangeManagerProvider
    extends $AsyncNotifierProvider<LifespanRangeManager, LifespanRange> {
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
    r'e5bbb9dd2ae8c9db8a3fbe6b37d3de9115cf8a11';

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
