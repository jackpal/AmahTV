import SwiftUI

struct VideoForm : View {
  @Binding public var video: Video
  @State private var urlOrVideoID: String = ""
  @StateObject private var videoMetadata = VideoMetadata()

  init(video: Binding<Video>) {
    _video = video
    _urlOrVideoID = State(initialValue:_video.wrappedValue.id)
  }

  var body: some View {
    Form {
      Section(header: Text("name-label")) {
        TextField("name-prompt", text: $video.name)
      }
      Section(header: Text("videoID-label")) {
        TextField("videoID-prompt", text: $urlOrVideoID)
      }
      .onChange(of: urlOrVideoID) {
        videoMetadata.resolve(urlOrVideoID: urlOrVideoID)
      }
      .onReceive(videoMetadata.objectWillChange) {_ in
        video.id = videoMetadata.videoID ?? ""
      }
      .onAppear {
        videoMetadata.resolve(urlOrVideoID: urlOrVideoID)
      }
      Section(header: Text("preview-label")) {
        VideoMetadataView(videoMetadata: videoMetadata)
        .frame(maxWidth: .infinity)
      }
    }
  }
}
