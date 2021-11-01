import SwiftUI

struct TVSettings: View {
  @ObservedObject public var tv: TV
  @Environment(\.presentationMode)
  var presentationMode: Binding<PresentationMode>
  @State
  var showAddChannelSheet = false

  var body: some View {
    NavigationView {
      List {
        ForEach(tv.channels) { channel in
          Text(channel.name)
        }.onDelete{
          tv.channels.remove(atOffsets: $0)
          tv.save()
        }.onMove {
          tv.channels.move(fromOffsets: $0, toOffset: $1)
          tv.save()
        }
      }
      .toolbar {
        EditButton()
      }
      .navigationBarTitle("Channels")
      .navigationBarItems(trailing:
                            HStack {
        Button("+") {
          showAddChannelSheet = true
        }
        .sheet(isPresented: $showAddChannelSheet) {
          AddChannelSheet(tv:tv)
    }
        Button("Dismiss"){
          self.presentationMode.wrappedValue.dismiss()
        }
               })
      }
                          }
                          }
