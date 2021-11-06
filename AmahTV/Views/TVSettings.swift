import SwiftUI

struct TVSettings: View {

  var body: some View {
    NavigationView {
      ChannelList()
      Text("Please choose a channel from the channel list.")
    }
  }
}
