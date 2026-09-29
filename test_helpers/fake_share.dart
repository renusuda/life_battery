import 'dart:ui';

import 'package:life_battery/src/features/share/data/api/share_api_data_source.dart';
import 'package:life_battery/src/features/share/domain/share_outcome.dart';

class FakeShareApiDataSource implements ShareApiDataSource {
  FakeShareApiDataSource({this.outcome = ShareOutcome.success});

  ShareOutcome outcome;

  final List<String> sharedTexts = [];
  final List<Rect?> sharePositionOrigins = [];

  @override
  Future<ShareOutcome> share({
    required String text,
    Rect? sharePositionOrigin,
  }) async {
    sharedTexts.add(text);
    sharePositionOrigins.add(sharePositionOrigin);
    return outcome;
  }
}
