import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/notifications/data/notification_repository.dart';

class ScheduleNotificationUseCase {
  const ScheduleNotificationUseCase({
    required NotificationRepository repository,
  }) : _repository = repository;

  final NotificationRepository _repository;

  Future<void> execute({
    required String title,
    required String body,
    required LifespanRange lifespanRange,
  }) async {
    final now = DateTime.now();
    final dropDate = lifespanRange.nextDropDate(now: now);
    if (dropDate == null) return;

    // Schedule at 9:00 AM on the drop date.
    final scheduledDate = DateTime(
      dropDate.year,
      dropDate.month,
      dropDate.day,
      9,
    );
    await _repository.scheduleNotification(
      title: title,
      body: body,
      scheduledDate: scheduledDate,
    );
  }
}
