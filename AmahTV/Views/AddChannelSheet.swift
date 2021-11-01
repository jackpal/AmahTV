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
        TextField("Name", text:$name)
        TextField("Video ID", text:$videoID)
      }
      .toolbar {
        Button("Save"){
          tv.channels.append(Channel(name:name, id:videoID))
          self.presentationMode.wrappedValue.dismiss()
        }
        Button("Dismiss"){
          self.presentationMode.wrappedValue.dismiss()
        }
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}
