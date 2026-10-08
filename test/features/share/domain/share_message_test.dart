import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/share/domain/share_message.dart';
import 'package:life_battery/src/features/share/domain/share_store_url.dart';

void main() {
  test('Puts the message, hashtag, and App Store URL on separate lines', () {
    final text = ShareMessage.build(
      message: "54% of my life left. What's yours?",
      hashtag: '#LifeBattery',
      platform: TargetPlatform.iOS,
    );

    expect(
      text,
      "54% of my life left. What's yours?\n"
      '#LifeBattery\n'
      '${ShareStoreUrl.appStore}',
    );
  });

  test('Uses the Play Store URL on Android', () {
    final text = ShareMessage.build(
      message: '人生あと54%だった。みんなは？',
      hashtag: '#ライフバッテリー',
      platform: TargetPlatform.android,
    );

    expect(
      text,
      '人生あと54%だった。みんなは？\n#ライフバッテリー\n${ShareStoreUrl.playStore}',
    );
  });

  test('Store URLs point at the published listings', () {
    expect(ShareStoreUrl.appStore, contains('id6449723058'));
    expect(ShareStoreUrl.playStore, contains('id=com.rururu.lifebt'));
  });
}
