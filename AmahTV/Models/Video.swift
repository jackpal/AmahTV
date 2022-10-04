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
    Video(name: "CTS", id: "uD_BrkpIGu0"), // Sometimes offline.
    Video(name: "SET", id: "EB4g7wecgTI"),
    Video(name: "CTV", id: "TCnaIE_SAtM"),
    Video(name: "TTV 1", id: "xL0ch83RAK8", referrer: "https://news.ttv.com.tw"), // Blocked from embedded, hard-code.
    // Video(name: "TTV", id: "wDYmSOo7pRM", referrer: "https://news.ttv.com.tw"), // This is a non-live channe.
    // Video(name: "CTi News", id: "kZKxmh-rY24"), Not live
    Video(name: "Global News", id: "qFhAXrviP5g"),
    Video(name: "FTV D 1", id: "bn7glmBPmIQ"),
    Video(name: "FTV D 2", id: "1kzVPwTeKds"),
    Video(name: "FTV D 3", id: "298QROP4xe0"),
  ]
#else
  static let videos = Videos()
#endif
}
