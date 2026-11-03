import 'package:life_battery/src/features/analytics/data/analytics_repository.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/notifications/data/notification_repository.dart';

class ScheduleNotificationUseCase {
  ScheduleNotificationUseCase({
    required NotificationRepository repository,
    required AnalyticsRepository analyticsRepository,
  }) : _repository = repository,
       _analyticsRepository = analyticsRepository;

  final NotificationRepository _repository;

  final AnalyticsRepository _analyticsRepository;

  Future<void> requestPermission() async {
    final granted = await _repository.requestPermission();
    await _analyticsRepository.logNotificationPermissionResult(
      granted: granted,
    );
  }

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
