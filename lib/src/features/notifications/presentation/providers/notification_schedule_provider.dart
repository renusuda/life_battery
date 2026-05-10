import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/notifications/use_case/schedule_notification_use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_schedule_provider.g.dart';

@riverpod
class NotificationSchedule extends _$NotificationSchedule {
  @override
  void build() {}

  Future<void> schedule({
    required String title,
    required String body,
    required LifespanRange lifespanRange,
  }) async {
    final useCase = await ref.read(scheduleNotificationUseCaseProvider.future);
    await useCase.execute(
      title: title,
      body: body,
      lifespanRange: lifespanRange,
    );
  }
}
