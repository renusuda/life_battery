import 'package:life_battery/src/features/notifications/data/notification_repository_provider.dart';
import 'package:life_battery/src/features/notifications/use_case/schedule_notification_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_notification_use_case_provider.g.dart';

@riverpod
Future<ScheduleNotificationUseCase> scheduleNotificationUseCase(Ref ref) async {
  final repository = await ref.watch(notificationRepositoryProvider.future);
  return ScheduleNotificationUseCase(repository: repository);
}
