// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifespan_progress_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lifespanProgressState)
const lifespanProgressStateProvider = LifespanProgressStateProvider._();

final class LifespanProgressStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<LifespanProgressState>,
          LifespanProgressState,
          FutureOr<LifespanProgressState>
        >
    with
        $FutureModifier<LifespanProgressState>,
        $FutureProvider<LifespanProgressState> {
  const LifespanProgressStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lifespanProgressStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lifespanProgressStateHash();

  @$internal
  @override
  $FutureProviderElement<LifespanProgressState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LifespanProgressState> create(Ref ref) {
    return lifespanProgressState(ref);
  }
}

String _$lifespanProgressStateHash() =>
    r'89afec1c30e8487af4b077bcc203bdb097cfe066';
