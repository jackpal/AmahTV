import SwiftUI

struct VideoMetadataView : View {
  @ObservedObject public var videoMetadata: VideoMetadata
  var body: some View {
    VStack {
      if let title = videoMetadata.title {
        Text(title)
        .fixedSize(horizontal: false, vertical: true)
        .lineLimit(nil)
        .textSelection(.enabled)
      }
      if let thumbnailURL = videoMetadata.thumbnailURL,
         let thumbnailWidth = videoMetadata.thumbnailWidth,
         let thumbnailHeight = videoMetadata.thumbnailHeight {
        AsyncImage(url:thumbnailURL)
          .aspectRatio(CGFloat(thumbnailWidth)/CGFloat(thumbnailHeight), contentMode: .fit)
      }
    }
  }
}
