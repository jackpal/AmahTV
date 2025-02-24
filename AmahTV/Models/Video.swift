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
    Video(name: "CTV News Channel", id: "TCnaIE_SAtM"), // News
    Video(name: "FTV", id: "ylYJSBUgaMA"), // Generalist,News,Entertainment
    Video(name: "TaiwanPlus", id: "gvV_mJsKLWQ"), // News,Information
    Video(name: "TTV", id: "xL0ch83RAK8"), // Taiwan TTV
    Video(name: "PTS News", id: "quwqlazU-c8"), // News,Current Affairs
    Video(name: "NTDAPTV", id: "GU5UsbkDQYk")
    
  ]
#else
  static let videos = Videos()
#endif
}
