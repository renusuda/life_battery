// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_schedule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationSchedule)
const notificationScheduleProvider = NotificationScheduleProvider._();

final class NotificationScheduleProvider
    extends $NotifierProvider<NotificationSchedule, void> {
  const NotificationScheduleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationScheduleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationScheduleHash();

  @$internal
  @override
  NotificationSchedule create() => NotificationSchedule();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$notificationScheduleHash() =>
    r'e13423f0d379c0d508a39d845de2dc2ad1de3af2';

abstract class _$NotificationSchedule extends $Notifier<void> {
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
