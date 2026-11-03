import 'package:life_battery/src/features/notifications/data/notification_repository.dart';

class FakeNotificationRepository extends NotificationRepository {
  FakeNotificationRepository({this.granted = true});

  bool granted;

  /// Runs while the permission is asked, as the system dialog would.
  Future<void> Function()? onRequestPermission;

  int permissionRequestCount = 0;

  int scheduleCount = 0;

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> requestPermission() async {
    permissionRequestCount++;
    await onRequestPermission?.call();
    return granted;
  }

  @override
  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    scheduleCount++;
  }
}
