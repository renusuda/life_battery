import 'dart:async';

import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lifespan_range_manager_provider.g.dart';

@riverpod
class LifespanRangeManager extends _$LifespanRangeManager {
  @override
  Future<LifespanRange> build() async {
    final lifespanRange = await ref
        .read(lifespanRepositoryProvider)
        .getLifespan();
    unawaited(
      ref
          .read(lifespanRepositoryProvider)
          .syncLifespanRangeToWidget(
            birthDate: lifespanRange.birthDate,
            idealAge: lifespanRange.idealAge,
          ),
    );
    return lifespanRange;
  }

  Future<void> updateLifespanRange({
    required DateTime birthDate,
    required int idealAge,
  }) async {
    await ref
        .read(lifespanRepositoryProvider)
        .updateLifespan(
          birthDate: birthDate,
          idealAge: idealAge,
        );
    ref.invalidateSelf();
  }
}
