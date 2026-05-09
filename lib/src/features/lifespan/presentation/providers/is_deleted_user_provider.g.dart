// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_deleted_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IsDeletedUser)
const isDeletedUserProvider = IsDeletedUserProvider._();

final class IsDeletedUserProvider
    extends $AsyncNotifierProvider<IsDeletedUser, bool> {
  const IsDeletedUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isDeletedUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isDeletedUserHash();

  @$internal
  @override
  IsDeletedUser create() => IsDeletedUser();
}

String _$isDeletedUserHash() => r'0a196e969892088f75b2ec644fa23cecf1eafacd';

abstract class _$IsDeletedUser extends $AsyncNotifier<bool> {
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
