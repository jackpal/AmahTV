import SwiftUI

struct EditVideo: View {
  @Binding public var video: Video
  var body: some View {
    VideoForm(video:$video)
    .navigationBarTitle("Edit video")
    .navigationBarTitleDisplayMode(.inline)
  }
}

