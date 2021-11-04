import SwiftUI

struct TVSettings: View {
  @ObservedObject public var tv: TV

  var body: some View {
    NavigationView {
      ChannelList(tv:tv)
      Text("Please choose a channel from the channel list.")
    }
  }
}
