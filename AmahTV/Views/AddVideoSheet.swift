import SwiftUI

struct AddVideoSheet: View {
  @ObservedObject public var tv: TV
  @Environment(\.presentationMode)
  var presentationMode: Binding<PresentationMode>

  @StateObject var videoMetadata = VideoMetadata()
  @State var video = Video(name:"", id:"")

  var body: some View {
    NavigationView {
      VideoForm(video:$video)
      .navigationBarItems(trailing: addButton)
      .navigationTitle("Add video")
    }
    .navigationViewStyle(.stack)
  }

  @ViewBuilder
  private var addButton : some View {
    Button("Add"){
      tv.videos.append(video)
      self.presentationMode.wrappedValue.dismiss()
    }
    .disabled(video.name.isEmpty || video.id.isEmpty)
  }

}
