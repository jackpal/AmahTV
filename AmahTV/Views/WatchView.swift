import SwiftUI

struct WatchView: View {
  @ObservedObject public var tv: TV
  @State private var showSettings = false
  @State private var showDetail = false

  var body: some View {
    NavigationView {
      VStack(spacing:0) {
        HStack {
          channelPicker
          settingsButton
        }
        YouTubeView(channel: tv.channel)
      }
      .navigationBarTitle("", displayMode: .inline)
      .navigationBarHidden(true)
    }
    .navigationViewStyle(.stack)
  }

  @ViewBuilder
  var settingsButton: some View {
    NavigationLink(destination: TVSettings(tv:tv), isActive: $showSettings) { EmptyView() }
    Button {
      showSettings = true
    } label: {
      Image(systemName: "gear").imageScale(.large)
    }
    .padding()
  }

  @ViewBuilder
  var channelPicker: some View {
    ChannelPicker(channels:$tv.channels, selectedChannelIndex: $tv.selectedChannelIndex)
  }
}
