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
      Form {
        Section(header: Text("Name")) {
          TextField("Short name of video", text:$name)
            .onReceive(name.publisher) {_ in
              updateChannel()
            }
        }
        Section(header: Text("Video ID")) {
          TextField("YouTube Link or Video ID", text:$urlOrVideoID)
            .onChange(of: urlOrVideoID) { newValue in
              videoMetadata.resolve(urlOrVideoID: urlOrVideoID)
            }
        }
        .onReceive(videoMetadata.objectWillChange) {_ in
          updateChannel()
        }

        Section(header: Text("Preview")) {
          if let channel = channel {
            VideoMetadataView(videoMetadata: videoMetadata, channel: channel)
          }
        }
      }
      .toolbar {
        saveButton
        cancelButton
      }
      .navigationTitle("Add video")
    }
    .navigationViewStyle(.stack)
  }

  @ViewBuilder
  private var saveButton : some View {
    Button("Save"){
      if let channel = channel {
        tv.channels.append(channel)
        self.presentationMode.wrappedValue.dismiss()
      }
    }
    .disabled(name.isEmpty || videoMetadata.videoID == nil)
  }

  @ViewBuilder
  private var cancelButton: some View {
    Button("Cancel"){
      self.presentationMode.wrappedValue.dismiss()
    }
  }
  
  private func updateChannel() {
    if let videoID = videoMetadata.videoID {
      channel = Channel(name: name, id: videoID)
    } else {
      channel = nil
    }
  }
}
