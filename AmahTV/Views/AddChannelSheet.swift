import SwiftUI

struct AddChannelSheet: View {
  @ObservedObject public var tv: TV
  @Environment(\.presentationMode)
  var presentationMode: Binding<PresentationMode>

  @State var name: String = ""
  @State var urlOrVideoID: String = ""
  @StateObject var videoMetadata = VideoMetadata()

  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Name", text:$name)
          TextField("YouTube Link or video ID", text:$urlOrVideoID)
            .onChange(of: urlOrVideoID) { newValue in
              videoMetadata.resolve(urlOrVideoID: urlOrVideoID)
            }
        }

        Section {
          VideoMetadataView(videoMetadata: videoMetadata)
        }
        Section {
          Button("Save"){
            if let vid = videoMetadata.videoID {
              tv.channels.append(Channel(name:name, id:vid))
              self.presentationMode.wrappedValue.dismiss()
            }
          }
          .disabled(name.isEmpty || videoMetadata.videoID == nil)
        }
      }
      .toolbar {
        Button("Dismiss"){
          self.presentationMode.wrappedValue.dismiss()
        }
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}
