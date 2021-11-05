import SwiftUI

struct AddChannelSheet: View {
  @ObservedObject public var tv: TV
  @Environment(\.presentationMode)
  var presentationMode: Binding<PresentationMode>

  @State var name: String = ""
  @State var urlOrVideoID: String = ""
  @StateObject var videoMetadata = VideoMetadata()
  @State var channel: Channel?

  var body: some View {
    NavigationView {
      VStack {
        Form {
          Section {
            TextField("Name", text:$name)
              .onReceive(name.publisher) {_ in
              updateChannel()
            }
            TextField("YouTube Link or video ID", text:$urlOrVideoID)
              .onChange(of: urlOrVideoID) { newValue in
                videoMetadata.resolve(urlOrVideoID: urlOrVideoID)
              }
          }
          .onReceive(videoMetadata.objectWillChange) {_ in
            updateChannel()
          }
          Section {
            Button("Save"){
              if let channel = channel {
                tv.channels.append(channel)
                self.presentationMode.wrappedValue.dismiss()
              }
            }
            .disabled(name.isEmpty || videoMetadata.videoID == nil)
          }
        }
        if let channel = channel {
          VideoMetadataView(videoMetadata: videoMetadata, channel: channel)
        }
      }
      .toolbar {
        Button("Dismiss"){
          self.presentationMode.wrappedValue.dismiss()
        }
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }

  private func updateChannel() {
    if let videoID = videoMetadata.videoID, name != "" {
      channel = Channel(name: name, id: videoID)
    } else {
      channel = nil
    }
  }
}
