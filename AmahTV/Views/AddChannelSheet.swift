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
    // Currently all the video IDs are of count 11, but that may change someday.
    if self.count == 11 {
      return self
    }
    let parts = self.components(separatedBy: "v=")
    if parts.count == 2 {
      let v = parts[1]
      if v.count == 11 {
        return v
      }
    }
    return nil
  }
}
