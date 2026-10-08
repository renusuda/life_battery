import 'dart:typed_data';
import 'dart:ui';

import 'package:life_battery/src/features/share/data/api/share_api_data_source.dart';
import 'package:life_battery/src/features/share/domain/share_outcome.dart';
import 'package:share_plus/share_plus.dart';

class SharePlusShareApiDataSource implements ShareApiDataSource {
  const SharePlusShareApiDataSource({required SharePlus sharePlus})
    : _sharePlus = sharePlus;

  final SharePlus _sharePlus;

  @override
  Future<ShareOutcome> share({
    required String text,
    required Uint8List imageBytes,
    Rect? sharePositionOrigin,
  }) async {
    final result = await _sharePlus.share(
      ShareParams(
        text: text,
        files: [
          XFile.fromData(
            imageBytes,
            mimeType: 'image/png',
            name: 'life_battery.png',
          ),
        ],
        sharePositionOrigin: sharePositionOrigin,
      ),
    );
    return switch (result.status) {
      ShareResultStatus.success => ShareOutcome.success,
      ShareResultStatus.dismissed => ShareOutcome.dismissed,
      ShareResultStatus.unavailable => ShareOutcome.unavailable,
    };
  }
}
