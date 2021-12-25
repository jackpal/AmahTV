import Foundation

struct Video : Equatable, Hashable, Identifiable, Codable {
  var name: String
  var url: URL {
    URL(string:"https://www.youtube.com/watch?v=\(id)")!
  }

  var id: String
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
    Video(name: "FTV", id: "XGEmg3vhrzU"),
    Video(name: "CTS News", id: "wM0g8EoUZ_E"),
    Video(name: "SET News", id: "FoBfXvlOR6I"),
    Video(name: "CTV News Channel", id: "TCnaIE_SAtM"),
    Video(name: "CTi News", id: "lu_BJKxqGnk"),
    Video(name: "Global News", id: "Fpsi2cmXGMs"),
    // Japanese
    Video(name: "Pokémon Kids TV", id: "HHIj221nbco"), // Edutainment
  ]
#else
  static let videos = Videos()
#endif
}
