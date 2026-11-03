import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/notifications/use_case/schedule_notification_use_case.dart';

import '../../../../test_helpers/fake_analytics.dart';
import '../../../../test_helpers/fake_notifications.dart';

void main() {
  late FakeAnalyticsApiDataSource fakeAnalytics;

  setUp(() {
    fakeAnalytics = FakeAnalyticsApiDataSource();
  });

  ScheduleNotificationUseCase buildUseCase({
    required FakeNotificationRepository repository,
  }) {
    return ScheduleNotificationUseCase(
      repository: repository,
      analyticsRepository: AnalyticsRepository(apiDataSource: fakeAnalytics),
    );
  }

  Future<void> execute(ScheduleNotificationUseCase useCase) {
    return useCase.execute(
      title: 'title',
      body: 'body',
      lifespanRange: LifespanRange(
        birthDate: DateTime(2000),
        idealAge: 100,
      ),
    );
  }

  test('Logs the granted permission result', () async {
    final useCase = buildUseCase(repository: FakeNotificationRepository());

    await useCase.requestPermission();

    expect(fakeAnalytics.notificationPermissionResults, [true]);
  });

  test('Logs the denied permission result', () async {
    final useCase = buildUseCase(
      repository: FakeNotificationRepository(granted: false),
    );

    await useCase.requestPermission();

    expect(fakeAnalytics.notificationPermissionResults, [false]);
  });

  test('Schedules without asking for the permission', () async {
    final repository = FakeNotificationRepository();
    final useCase = buildUseCase(repository: repository);

    await execute(useCase);

    expect(repository.scheduleCount, 1);
    expect(repository.permissionRequestCount, 0);
    expect(fakeAnalytics.notificationPermissionResults, isEmpty);
  });
}
