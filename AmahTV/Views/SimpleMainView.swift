import SwiftUI

struct SimpleMainView : View {
  @StateObject var monitor = NetworkStatusMonitor()

  var body : some View {
    WatchView()
      .overlay {
        monitor.status == .disconnected ? NetworkDisconnectedView() : nil
      }
  }
}
