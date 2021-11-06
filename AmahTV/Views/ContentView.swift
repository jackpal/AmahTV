import SwiftUI

struct ContentView : View {
  @AppStorage("hide_advanced_features") var hideAdvancedFeatures = false
  @ObservedObject public var tv: TV

  var body: some View {
    if hideAdvancedFeatures {
      SimpleMainView(tv:tv)
    } else {
      AdvancedMainView(tv:tv)
    }
  }

}
