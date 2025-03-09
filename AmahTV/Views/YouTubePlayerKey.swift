import SwiftUI
import YouTubePlayerKit

private struct YouTubePlayerKey: EnvironmentKey {
    static let defaultValue = YouTubePlayer(
        parameters:.init(
            autoPlay:true,
            showControls:true,
            showFullscreenButton:false,
            restrictRelatedVideosToSameChannel:true,
            originURL: URL(string:"https://www.youtube.com")!, // Required for "Must be played from YouTube" videos.
            referrerURL: URL(string:"https://www.youtube.com")
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
