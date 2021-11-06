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
        Section(header: Text("Name")) {
          TextField("Name", text: $video.name)
        }
        Section(header: Text("YouTube Link or Video ID")) {
          TextField("YouTube Link or video ID", text: $urlOrVideoID)
        }
        Section(header: Text("Preview")) {
          VideoMetadataView(videoMetadata: videoMetadata, video:video)
        }
      }
    }
    .navigationBarTitle("Video properties")
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

