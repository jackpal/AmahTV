import SwiftUI
import YouTubePlayerKit

private struct TVKey: EnvironmentKey {
  static let defaultValue = TV()
}

extension EnvironmentValues {
  var tv: TV {
    get { self[TVKey.self] }
    set { self[TVKey.self] = newValue }
  }
}

extension View {
  func tv (_ tv: TV) -> some View {
    environment(\.tv, tv)
  }
}
