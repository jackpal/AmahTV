import SwiftUI

struct ContentView : View {
  @ObservedObject public var tv: TV
  @State private var selection: Tab = .watch

  enum Tab {
    case watch
    case settings
  }

  var body: some View {
    TabView(selection: $selection) {
      WatchView(tv:tv)
        .tabItem {
          Label("TV", systemImage: "tv")
        }

        .tag(Tab.watch)

      TVSettings(tv:tv)
        .tabItem {
          Label("Settings", systemImage: "gear")
        }

        .tag(Tab.settings)
    }
  }}
