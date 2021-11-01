import SwiftUI

struct WatchView: View {
  @ObservedObject public var tv: TV
  @State
  var showSettings = false
  var body: some View {
    VStack {
      HStack {
        ChannelPicker(channels:$tv.channels, selectedChannelIndex: $tv.selectedChannelIndex)
        Button {
          showSettings = true
        } label: {
          Image(systemName: "gear")
        }
        .padding()
          .sheet(isPresented: $showSettings) {
            TVSettings(tv:tv)
      }
      }
      YouTubeView(channel:tv.channel)
    }
  }
}
