import SwiftUI

struct WatchView: View {
  @ObservedObject public var tv: TV
  var body: some View {
    VStack {
      ChannelPicker(channels:$tv.channels, selectedChannelIndex: $tv.selectedChannelIndex)
      YouTubeView(channel:tv.channel)
    }
  }
}
