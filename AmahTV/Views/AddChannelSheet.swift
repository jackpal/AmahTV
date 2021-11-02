import SwiftUI

struct AddChannelSheet: View {
  @ObservedObject public var tv: TV
  @Environment(\.presentationMode)
  var presentationMode: Binding<PresentationMode>

  @State var name: String = ""
  @State var videoID: String = ""

  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Name", text:$name)
          TextField("Video ID or YouTube Link", text:$videoID)
        }
        Section {
          Button("Save"){
            if let vid = videoID.videoID {
              tv.channels.append(Channel(name:name, id:vid))
              self.presentationMode.wrappedValue.dismiss()
            }
          }
          .disabled(name.isEmpty || videoID.videoID == nil)
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

extension String {
  var videoID : String? {
    // TODO: resolve the URL to handle URL shorteners.
    if let url = URL(string: self),
       let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
       let queryItems = components.queryItems,
       let v = queryItems.first(where: {$0.name == "v"}) {
      return v.value
    }
    // Currently all the video IDs are of count 11, but that may change someday.
    if self.count == 11 {
      return self
    }
    return nil
  }
}
