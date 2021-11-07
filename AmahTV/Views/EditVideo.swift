import SwiftUI

struct EditVideo: View {
  @Binding public var video: Video
  @State var urlOrVideoID: String = ""
  @StateObject var videoMetadata =  VideoMetadata()
  init(video: Binding<Video>) {
    _video = video
    _urlOrVideoID = State(initialValue:_video.wrappedValue.id)
  }
  var body: some View {
    VStack {
      Form {
        Section(header: Text(VideoForm.nameLabel)) {
          TextField(VideoForm.namePrompt, text: $video.name)
        }
        Section(header: Text(VideoForm.videoIDLabel)) {
          TextField(VideoForm.videoIDPrompt, text: $urlOrVideoID)
        }
        Section(header: Text(VideoForm.previewLabel)) {
          VideoMetadataView(videoMetadata: videoMetadata, video:video)
        }
      }
    }
    .navigationBarTitle("Edit video")
    .navigationBarTitleDisplayMode(.inline)
    .onAppear {
      videoMetadata.resolve(urlOrVideoID: urlOrVideoID)
    }
    .onDisappear {
      if let videoID = videoMetadata.videoID {
        video.id = videoID
      }
    }
  }
}

