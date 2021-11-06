import SwiftUI

struct SimpleMainView : View {
  @ObservedObject public var tv: TV
  
  var body : some View {
    WatchView(tv:tv)
  }
}
