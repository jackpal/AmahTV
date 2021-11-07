import SwiftUI

struct WatchView: View {
  @EnvironmentObject private var tv: TV

  @StateObject private var playerState = YouTubeControlState()

  var body: some View {
    switch tv.videos.count {
    case 0:
      Text("No videos available.")
    case 1:
      youTubeView
    default:
      VStack(spacing:0) {
        videoPicker
        youTubeView
      }
    }
  }

  @ViewBuilder
  var videoPicker: some View {
    VideoPicker(videos:$tv.videos, selectedVideoIndex: $tv.selectedVideo)
  }

  @ViewBuilder
  var youTubeView: some View {
    YouTubeView(playerState: playerState)
      .onAppear{
        playerState.videoID = tv.videos[tv.selectedVideo].id
      }
      .onChange(of: tv.videos[tv.selectedVideo].id) { newVideoID in
        playerState.videoID = newVideoID
      }
  }
}
