import SwiftUI
import YouTubePlayerKit

struct VideoMetadataView : View {
  @ObservedObject public var videoMetadata: VideoMetadata
  public let channel: Channel
  var body: some View {
    VStack {
      if let title = videoMetadata.title {
        Text(title).lineLimit(nil).textSelection(.enabled)
      }
      YouTubeView(channel: channel)

    }
  }
}
