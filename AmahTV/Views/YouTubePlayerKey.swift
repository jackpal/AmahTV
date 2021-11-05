import SwiftUI
import YouTubePlayerKit

private struct YouTubePlayerKey: EnvironmentKey {
  static let defaultValue = YouTubePlayer()
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
