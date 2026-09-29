import 'package:flutter/foundation.dart';
import 'package:life_battery/src/features/share/domain/share_store_url.dart';

class ShareMessage {
  const ShareMessage._();

  /// One item per line: X and LINE render the newlines as-is, and a URL on
  /// its own line gets a reliable link preview.
  static String build({
    required String message,
    required String hashtag,
    required TargetPlatform platform,
  }) {
    return '$message\n$hashtag\n${ShareStoreUrl.forPlatform(platform)}';
  }
}
