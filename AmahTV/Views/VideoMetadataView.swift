import SwiftUI
import YouTubePlayerKit

struct VideoMetadataView : View {
  @ObservedObject public var videoMetadata: VideoMetadata
  public let video: Video
  var body: some View {
    VStack {
      if let title = videoMetadata.title {
        Text(title).lineLimit(nil).textSelection(.enabled)
      }
      if let thumbnailURL = videoMetadata.thumbnailURL,
         let thumbnailWidth = videoMetadata.thumbnailWidth,
         let thumbnailHeight = videoMetadata.thumbnailHeight{
        AsyncImage(url:thumbnailURL)
          .aspectRatio(CGFloat(thumbnailWidth)/CGFloat(thumbnailHeight), contentMode: .fit)
      }

    }
  }
}
