import SwiftUI

struct ChannelList: View {
  @EnvironmentObject private var tv: TV
  @State var showAddChannelSheet = false

  var body: some View {
    List {
      ForEach($tv.channels) { $channel in
        NavigationLink(destination:
                        LazyView(YouTubeView(channel:channel))) {
          Text(channel.name)
        }
      }.onDelete {
        tv.channels.remove(atOffsets: $0)
        tv.save()
      }.onMove {
        tv.channels.move(fromOffsets: $0, toOffset: $1)
        tv.save()
      }
      .onDisappear {
        tv.save()
      }
    }
    .navigationBarTitle("Channels", displayMode: .inline)
    .navigationBarItems(trailing:
                          HStack {
      EditButton()
      addChannel
    })
  }

  var addChannel: some View {
    Button(action: {
      showAddChannelSheet = true
    }){ Image(systemName: "plus.rectangle").imageScale(.large)
    }
    .sheet(isPresented: $showAddChannelSheet) {
      AddChannelSheet(tv:tv)
    }
  }
}
