//
//  Channels.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import Foundation

struct Channel : Equatable, Hashable, Identifiable, Codable {
  var name: String
  var url: URL {
    URL(string:"https://www.youtube.com/watch?v=\(id)")!
  }

  var id: String
}

typealias Channels = [Channel]

extension Channels: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(Channels.self, from: data)
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

/// Channels from https://www.squidtv.net/asia/taiwan/

extension Channel {
  static let channels = [
    Channel(name: "中視新聞", id: "TCnaIE_SAtM"),
    Channel(name: "EBC 東森新聞 51", id: "R2iMq5LKXco"),
    Channel(name: "民視新聞 53", id: "XxJKnDLYZz4"),
    Channel(name: "三立 LIVE 新聞直播", id: "CKjSm5ZeehE"),
    Channel(name: "東森財經", id: "zNESDscyCmk"),
    Channel(name: "中天新聞24小時", id: "lu_BJKxqGnk"),
    Channel(name: "TVBS新聞 55", id: "V0WxUakDV7M"),
    Channel(name: "TVBS選新聞 56", id: "hP6_jfCFxyQ"),
    Channel(name: "EBC 東森財經新聞 57", id: "ABn_ccXn_jc"),
    Channel(name: "TTV台視新聞", id: "xL0ch83RAK8"),
    Channel(name: "CTS華視直播頻道", id: "yUTy1U1wTwE"),
    Channel(name: "寰宇新聞台", id: "bn-zNDGLgDw"),
    Channel(name: "信大電視台線上直播", id: "fYcDmJ4XlZ0")
  ]
}
