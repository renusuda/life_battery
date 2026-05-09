import 'dart:async';

import 'package:life_battery/src/features/lifespan/data/lifespan_repository.dart';

class ToggleDisplayModeUseCase {
  const ToggleDisplayModeUseCase({required LifespanRepository repository})
    : _repository = repository;

  final LifespanRepository _repository;

  void execute({required bool isPercentageMode}) {
    unawaited(
      _repository.updateIsPercentageMode(isPercentageMode: isPercentageMode),
    );
    unawaited(
      _repository.syncDisplayModeToWidget(isPercentageMode: isPercentageMode),
    );
  }
}
