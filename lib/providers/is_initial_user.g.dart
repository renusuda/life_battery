// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_initial_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// app theme mode.

@ProviderFor(IsInitialUser)
const isInitialUserProvider = IsInitialUserProvider._();

/// app theme mode.
final class IsInitialUserProvider
    extends $AsyncNotifierProvider<IsInitialUser, bool> {
  /// app theme mode.
  const IsInitialUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isInitialUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isInitialUserHash();

  @$internal
  @override
  IsInitialUser create() => IsInitialUser();
}

String _$isInitialUserHash() => r'89affb517122a07a38ff4909696640fd4cbb0ec0';

/// app theme mode.

abstract class _$IsInitialUser extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<bool>, bool>,
        AsyncValue<bool>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
