// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_initial_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IsInitialUser)
const isInitialUserProvider = IsInitialUserProvider._();

final class IsInitialUserProvider
    extends $AsyncNotifierProvider<IsInitialUser, bool> {
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

String _$isInitialUserHash() => r'8b583ab0d73e83852bf322355aa9adbd6ec7d344';

abstract class _$IsInitialUser extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
