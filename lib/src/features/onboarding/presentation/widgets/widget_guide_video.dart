import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_battery/src/extensions/extensions.dart';

/// A native player so the video can continue as Picture in Picture while the
/// user adds the widget on the Home Screen; Flutter-rendered video cannot.
class WidgetGuideVideo extends StatelessWidget {
  const WidgetGuideVideo({super.key});

  static const viewType = 'life_battery/widget_guide_video';

  @override
  Widget build(BuildContext context) {
    final asset = context.isJapanese
        ? 'assets/videos/widget_guide_ja.mp4'
        : 'assets/videos/widget_guide_en.mp4';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: AspectRatio(
        aspectRatio: 540 / 1170,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: UiKitView(
            viewType: viewType,
            creationParams: {'asset': asset},
            creationParamsCodec: const StandardMessageCodec(),
          ),
        ),
      ),
    );
  }
}
