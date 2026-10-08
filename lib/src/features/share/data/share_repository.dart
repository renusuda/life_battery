import 'dart:typed_data';
import 'dart:ui';

import 'package:life_battery/src/features/share/data/api/share_api_data_source.dart';
import 'package:life_battery/src/features/share/domain/share_outcome.dart';

class ShareRepository {
  const ShareRepository({required ShareApiDataSource apiDataSource})
    : _apiDataSource = apiDataSource;

  final ShareApiDataSource _apiDataSource;

  Future<ShareOutcome> share({
    required String text,
    required Uint8List imageBytes,
    Rect? sharePositionOrigin,
  }) {
    return _apiDataSource.share(
      text: text,
      imageBytes: imageBytes,
      sharePositionOrigin: sharePositionOrigin,
    );
  }
}
