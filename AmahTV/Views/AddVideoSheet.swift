import SwiftUI

struct AddVideoSheet: View {
  @ObservedObject public var tv: TV
  @Environment(\.presentationMode)
  var presentationMode: Binding<PresentationMode>

  @State var name: String = ""
  @State var urlOrVideoID: String = ""
  @StateObject var videoMetadata = VideoMetadata()
  @State var video: Video?

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text(VideoForm.nameLabel)) {
          TextField(VideoForm.namePrompt, text:$name)
            .onReceive(name.publisher) {_ in
              updateVideo()
            }
        }
        Section(header: Text(VideoForm.videoIDLabel)) {
          TextField(VideoForm.videoIDPrompt, text:$urlOrVideoID)
            .onChange(of: urlOrVideoID) { newValue in
              videoMetadata.resolve(urlOrVideoID: urlOrVideoID)
            }
        }
        .onReceive(videoMetadata.objectWillChange) {_ in
          updateVideo()
        }

        Section(header: Text(VideoForm.previewLabel)) {
          if let video = video {
            VideoMetadataView(videoMetadata: videoMetadata, video: video)
          }
        }
      }
      .toolbar {
        addButton
        cancelButton
      }
      .navigationTitle("Add video")
    }
    .navigationViewStyle(.stack)
  }

  @ViewBuilder
  private var addButton : some View {
    Button("Add"){
      if let video = video {
        tv.videos.append(video)
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

  private func updateVideo() {
    if let videoID = videoMetadata.videoID {
      video = Video(name: name, id: videoID)
    } else {
      video = nil
    }
  }
}
