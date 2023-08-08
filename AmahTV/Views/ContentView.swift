import SwiftUI

struct ContentView : View {
  @AppStorage("hide_advanced_features") var hideAdvancedFeatures = true

  var body: some View {
    mainView
    
  }
  
  @ViewBuilder
  var mainView: some View {
    if hideAdvancedFeatures {
      SimpleMainView()
    } else {
      AdvancedMainView()
    }

  }

}
