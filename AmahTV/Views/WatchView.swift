import SwiftUI

struct WatchView: View {
  @ObservedObject public var tv: TV

  var body: some View {
    VStack(spacing:0) {
      channelPicker
      YouTubeView(channel: tv.channel)
    }
  }

  @ViewBuilder
  var channelPicker: some View {
    ChannelPicker(channels:$tv.channels, selectedChannelIndex: $tv.selectedChannelIndex)
  }
}
