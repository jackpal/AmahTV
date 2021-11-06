import SwiftUI

struct AdvancedMainView : View {
  @State private var selection: Tab = .watch

  enum Tab {
    case watch
    case settings
  }

  var body: some View {
    TabView(selection: $selection) {
      WatchView()
        .tabItem {
          Label("TV", systemImage: "tv")
        }
        .tag(Tab.watch)

      TVSettings()
        .tabItem {
          Label("Settings", systemImage: "gear")
        }
        .tag(Tab.settings)
    }
  }

}
