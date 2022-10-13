import SwiftUI

struct NetworkDisconnectedView: View {
    
    @StateObject var nw = NetworkStatusMonitor()
    
    var body: some View {
        VStack {
          Image(systemName: "wifi.slash")
          Text("No Network")
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding(8)
        .background(.thinMaterial)
        .cornerRadius(15)
    }
}
