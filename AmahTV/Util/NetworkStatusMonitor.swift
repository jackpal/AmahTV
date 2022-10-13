import Network
import SwiftUI

// See https://stackoverflow.com/questions/65816559/using-reachability-library-to-swiftui-based-app-to-notify-when-network-is-lost

// An enum to handle the network status
enum NetworkStatus: String {
    case connected
    case disconnected
}

class NetworkStatusMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")

    @Published private(set) var status: NetworkStatus = .connected
    @Published private(set) var isCellular = false

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            // Monitor runs on a background thread so we need to publish
            // on the main thread
            DispatchQueue.main.async {
                self.isCellular = path.usesInterfaceType(.cellular)
                if path.status == .satisfied {
                    print("We're connected!")
                    self.status = .connected
                } else {
                    print("No connection.")
                    self.status = .disconnected
                }
            }
        }
        monitor.start(queue: queue)
    }
}
