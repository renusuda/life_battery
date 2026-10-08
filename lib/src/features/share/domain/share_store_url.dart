import 'package:flutter/foundation.dart';

class ShareStoreUrl {
  const ShareStoreUrl._();

  static const appStore = 'https://apps.apple.com/app/id6449723058';

  static const playStore =
      'https://play.google.com/store/apps/details?id=com.rururu.lifebt';

  static String forPlatform(TargetPlatform platform) {
    return switch (platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => appStore,
      _ => playStore,
    };
  }
}
