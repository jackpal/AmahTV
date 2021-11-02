import SwiftUI

struct EditChannel: View {
  @Binding public var channel : Channel
  @State private var videoIDOrLink: String
  init(channel: Binding<Channel>) {
    _channel = channel
    _videoIDOrLink = State(initialValue:_channel.wrappedValue.id)
  }
  var body: some View {
    Form {
      TextField("Name", text: $channel.name)
      TextField("Video ID or YouTube Link", text: $videoIDOrLink)
    }
    .onDisappear {
      if let videoID = videoIDOrLink.videoID {
        channel.id = videoID
      }
    }
  }
}

