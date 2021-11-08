import SwiftUI

struct WatchView: View {
  @EnvironmentObject private var tv: TV

  var body: some View {
    switch tv.videos.count {
    case 0:
      Text("Please use the Settings tab to add some videos.")
    case 1:
      YouTubeView(video:tv.videos[0])
    default:
      VStack(spacing:0) {
        videoPicker
        YouTubeView(video: tv.video)
      }
    }
  }

  @ViewBuilder
  var videoPicker: some View {
    VideoPicker(videos:$tv.videos, selectedVideoIndex: $tv.selectedVideo)
  }
}
