import 'package:life_battery/src/features/notifications/data/notification_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository_provider.g.dart';

@Riverpod(keepAlive: true)
Future<NotificationRepository> notificationRepository(Ref ref) async {
  final repository = NotificationRepository();
  await repository.initialize();
  return repository;
}
