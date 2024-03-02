import Foundation

struct Video : Equatable, Hashable, Identifiable, Codable {
  var name: String
  var id: String
  var referrer: String?

  var url: URL {
    URL(string:"https://www.youtube.com/watch?v=\(id)")!
  }
}

typealias Videos = [Video]

extension Videos: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(Videos.self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

/// Videos from https://www.squidtv.net/asia/taiwan/

extension Video {
#if DEBUG
  static let videos = [
    // Taiwan
    Video(name: "FTV", id: "ylYJSBUgaMA"),
    // Video(name: "CTS", id: "Jf2OIbmdAio"), // Always offline.
    Video(name: "SET", id: "FoBfXvlOR6I"),
    Video(name: "CTV", id: "TCnaIE_SAtM"),
    // Video(name: "TTV 1", id: "xL0ch83RAK8", referrer: "https://news.ttv.com.tw"), // Blocked from embedded, hard-code.
    // Video(name: "TTV", id: "wDYmSOo7pRM", referrer: "https://news.ttv.com.tw"), // This is a non-live channel.
    // Cycle the live stream every day. Video(name: "CTi News", id: "xAqAZIr5izk"),
    // Global News
    Video(name: "GN1", id: "w87VGpgd90U"),
    Video(name: "GN2", id: "vOue3tgccd0"),
    Video(name: "GN3", id: "6IquAgfvYmc"),
    // Dramas, Not watched:
//    Video(name: "FTV D 1", id: "bn7glmBPmIQ"),
//    Video(name: "FTV D 2", id: "1kzVPwTeKds"),
//    Video(name: "FTV D 3", id: "298QROP4xe0"),
  ]
#else
  static let videos = Videos()
#endif
}
