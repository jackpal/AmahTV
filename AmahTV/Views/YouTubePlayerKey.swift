import SwiftUI
import YouTubePlayerKit

private struct YouTubePlayerKey: EnvironmentKey {
    static let defaultValue = YouTubePlayer(
        parameters:.init(
            autoPlay:true,
            showControls:false,
            showFullscreenButton:false,
            restrictRelatedVideosToSameChannel:true
        ),
        configuration:.init(
            allowsAirPlayForMediaPlayback: false
        )
    )
}

extension EnvironmentValues {
  var youTubePlayer: YouTubePlayer {
    get { self[YouTubePlayerKey.self] }
    set { self[YouTubePlayerKey.self] = newValue }
  }
}

extension View {
  func youTubePlayer(_ youTubePlayer: YouTubePlayer) -> some View {
    environment(\.youTubePlayer, youTubePlayer)
  }
}
