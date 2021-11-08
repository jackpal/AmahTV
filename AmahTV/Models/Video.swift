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
    Video(name: "中視新聞", id: "TCnaIE_SAtM"),
    Video(name: "EBC 東森新聞 51", id: "R2iMq5LKXco"),
    Video(name: "民視新聞 53", id: "XxJKnDLYZz4"),
    Video(name: "三立 LIVE 新聞直播", id: "CKjSm5ZeehE"),
    Video(name: "東森財經", id: "zNESDscyCmk"),
    Video(name: "中天新聞24小時", id: "lu_BJKxqGnk"),
    Video(name: "TVBS新聞 55", id: "V0WxUakDV7M"),
    Video(name: "TVBS選新聞 56", id: "hP6_jfCFxyQ"),
    Video(name: "EBC 東森財經新聞 57", id: "ABn_ccXn_jc"),
    Video(name: "CTS華視直播頻道", id: "yUTy1U1wTwE"),
    Video(name: "寰宇新聞台", id: "bn-zNDGLgDw")
  ]
#else
  static let videos = Videos()
#endif
}
