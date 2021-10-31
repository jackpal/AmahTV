import SwiftUI

struct WatchView: View {
  @Binding public var channels: Channels
  @Binding public var selectedChannelIndex: Int
  var body: some View {
    VStack {
      ChannelPicker(channels:$channels, selectedChannelIndex: $selectedChannelIndex)
      YouTubeView(channels:$channels, selectedChannelIndex: $selectedChannelIndex)
    }
  }
}
