import 'dart:typed_data';
import 'dart:ui';

import 'package:life_battery/src/features/share/domain/share_outcome.dart';

// Interface so tests can inject a fake.
// ignore: one_member_abstracts
abstract interface class ShareApiDataSource {
  /// [sharePositionOrigin] anchors the iPad popover; iPadOS refuses to
  /// present the share sheet without it.
  Future<ShareOutcome> share({
    required String text,
    required Uint8List imageBytes,
    Rect? sharePositionOrigin,
  });
}
