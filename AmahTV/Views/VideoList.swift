import SwiftUI

struct VideoList: View {
  @EnvironmentObject private var tv: TV
  @State var showAddVideoSheet = false

  var body: some View {
    List {
      ForEach($tv.videos) { $video in
        NavigationLink(destination:
                        LazyView(EditVideo(video:$video))) {
          Text(video.name)
        }
      }.onDelete {
        tv.videos.remove(atOffsets: $0)
        tv.save()
      }.onMove {
        tv.videos.move(fromOffsets: $0, toOffset: $1)
        tv.save()
      }
      .onDisappear {
        tv.save()
      }
    }
    .navigationBarTitle("Videos", displayMode: .inline)
    .navigationBarItems(trailing:
                          HStack {
      EditButton()
      addVideoButton
    })
  }

  var addVideoButton: some View {
    Button(action: {
      showAddVideoSheet = true
    }){ Image(systemName: "plus.rectangle").imageScale(.large)
    }
    .sheet(isPresented: $showAddVideoSheet) {
      AddVideoSheet(tv:tv)
    }
  }
}
