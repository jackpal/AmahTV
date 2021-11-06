import SwiftUI

struct WatchView: View {
  @EnvironmentObject private var tv: TV

  var body: some View {
    VStack(spacing:0) {
      videoPicker
      YouTubeView(video: tv.video)
    }
  }

  @ViewBuilder
  var videoPicker: some View {
    VideoPicker(videos:$tv.videos, selectedVideoIndex: $tv.selectedVideo)
  }
}
