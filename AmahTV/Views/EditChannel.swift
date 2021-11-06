import SwiftUI

struct EditChannel: View {
  @Binding public var channel : Channel
  @State var urlOrVideoID: String = ""
  @StateObject var videoMetadata =  VideoMetadata()
  init(channel: Binding<Channel>) {
    _channel = channel
    _urlOrVideoID = State(initialValue:_channel.wrappedValue.id)
  }
  var body: some View {
    VStack {
      Form {
        Section(header: Text("Name")) {
          TextField("Name", text: $channel.name)
        }
        Section(header: Text("YouTube Link or Video ID")) {
          TextField("YouTube Link or video ID", text: $urlOrVideoID)
        }
        Section(header: Text("Preview")) {
          VideoMetadataView(videoMetadata: videoMetadata, channel:channel)
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
        channel.id = videoID
      }
    }
  }
}

