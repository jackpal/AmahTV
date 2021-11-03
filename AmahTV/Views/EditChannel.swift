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
        Section {
          TextField("Name", text: $channel.name)
          TextField("YouTube Link or video ID", text: $urlOrVideoID)
        }
      }
      VideoMetadataView(videoMetadata: videoMetadata)
    }
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

