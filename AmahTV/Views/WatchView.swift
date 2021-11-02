import SwiftUI

struct WatchView: View {
  @ObservedObject public var tv: TV
  @State private var showSettings = false
  @State private var showDetail = false

  var body: some View {
    VStack(spacing:0) {
      HStack {
        channelPicker
        settingsButton
      }
      YouTubeView(channel: tv.channel)
    }
  }

  @ViewBuilder
  var settingsButton: some View {
    Button {
      showSettings = true
    } label: {
      Image(systemName: "gear").imageScale(.large)
    }
    .padding()
    .sheet(isPresented: $showSettings) {
      TVSettings(tv:tv)
    }
  }

  @ViewBuilder
  var channelPicker: some View {
    ChannelPicker(channels:$tv.channels, selectedChannelIndex: $tv.selectedChannelIndex)
  }
}
