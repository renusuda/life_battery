// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationRepository)
const notificationRepositoryProvider = NotificationRepositoryProvider._();

final class NotificationRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<NotificationRepository>,
          NotificationRepository,
          FutureOr<NotificationRepository>
        >
    with
        $FutureModifier<NotificationRepository>,
        $FutureProvider<NotificationRepository> {
  const NotificationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<NotificationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NotificationRepository> create(Ref ref) {
    return notificationRepository(ref);
  }
}

String _$notificationRepositoryHash() =>
    r'1ba66dc2df679836f6b3ecd4dd1c73b2c3c1952e';
