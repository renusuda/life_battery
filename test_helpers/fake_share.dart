import 'dart:typed_data';
import 'dart:ui';

import 'package:life_battery/src/features/share/data/api/share_api_data_source.dart';
import 'package:life_battery/src/features/share/domain/share_outcome.dart';

class FakeShareApiDataSource implements ShareApiDataSource {
  FakeShareApiDataSource({this.outcome = ShareOutcome.success});

  ShareOutcome outcome;

  final List<String> sharedTexts = [];
  final List<Uint8List> sharedImages = [];
  final List<Rect?> sharePositionOrigins = [];

  @override
  Future<ShareOutcome> share({
    required String text,
    required Uint8List imageBytes,
    Rect? sharePositionOrigin,
  }) async {
    sharedTexts.add(text);
    sharedImages.add(imageBytes);
    sharePositionOrigins.add(sharePositionOrigin);
    return outcome;
  }
}
