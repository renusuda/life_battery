import AVFoundation
import AVKit
import Flutter
import UIKit

/// Continues as Picture in Picture so the guide stays visible while the user
/// adds the widget on the Home Screen.
final class WidgetGuideVideoViewFactory: NSObject, FlutterPlatformViewFactory {
  static let viewType = "life_battery/widget_guide_video"

  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {
    let params = args as? [String: Any]
    let asset = params?["asset"] as? String ?? ""
    return WidgetGuideVideoView(frame: frame, asset: asset)
  }

  func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    FlutterStandardMessageCodec.sharedInstance()
  }
}

final class WidgetGuideVideoView: NSObject, FlutterPlatformView {
  private let playerView = PlayerLayerView()
  private let player = AVQueuePlayer()
  private var looper: AVPlayerLooper?
  private var pipController: AVPictureInPictureController?

  init(frame: CGRect, asset: String) {
    super.init()
    playerView.frame = frame
    playerView.playerLayer.player = player
    playerView.playerLayer.videoGravity = .resizeAspect

    let key = FlutterDartProject.lookupKey(forAsset: asset)
    if let path = Bundle.main.path(forResource: key, ofType: nil) {
      let item = AVPlayerItem(url: URL(fileURLWithPath: path))
      looper = AVPlayerLooper(player: player, templateItem: item)
    }
    player.isMuted = true

    // Picture in Picture needs a playback session even for a silent video;
    // mixing keeps the user's music playing.
    let session = AVAudioSession.sharedInstance()
    try? session.setCategory(.playback, mode: .moviePlayback, options: [.mixWithOthers])
    try? session.setActive(true)

    if AVPictureInPictureController.isPictureInPictureSupported() {
      let controller = AVPictureInPictureController(playerLayer: playerView.playerLayer)
      controller?.canStartPictureInPictureAutomaticallyFromInline = true
      pipController = controller
    }
    player.play()
  }

  func view() -> UIView {
    playerView
  }

  deinit {
    player.pause()
    try? AVAudioSession.sharedInstance().setActive(false, options: [.notifyOthersOnDeactivation])
  }
}

private final class PlayerLayerView: UIView {
  override class var layerClass: AnyClass {
    AVPlayerLayer.self
  }

  var playerLayer: AVPlayerLayer {
    layer as! AVPlayerLayer
  }
}
