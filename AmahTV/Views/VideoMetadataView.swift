import SwiftUI

struct VideoMetadataView : View {
  @ObservedObject public var videoMetadata: VideoMetadata
  var body: some View {
    VStack {
      if let title = videoMetadata.title {
        Text(title).lineLimit(nil).textSelection(.enabled)
      }
      if let thumbnailURL = videoMetadata.thumbnailURL {
        AsyncImage(url:thumbnailURL)
      }
    }
  }
}
