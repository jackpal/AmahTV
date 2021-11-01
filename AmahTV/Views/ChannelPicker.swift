import SwiftUI

struct ChannelPicker: View {
  @Binding public var channels: Channels

  @Binding public var selectedChannelIndex: Int

  var body: some View {
      Picker(selection: $selectedChannelIndex, label: Text("Channel")) {
        ForEach(Array(channels.enumerated()), id: \.1) {index, channel in
          Text(channel.name)
            .tag(index)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
  }
}
