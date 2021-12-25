import SwiftUI

struct ContentView : View {
  @AppStorage("hide_advanced_features") var hideAdvancedFeatures = true

  var body: some View {
    if hideAdvancedFeatures {
      SimpleMainView()
    } else {
      AdvancedMainView()
    }
  }

}
