//
//  OEmbed.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/30/21.
//

import Foundation

/// See https://oembed.com/ for more information.
struct OEmbed : Codable {
  var title: String?
  var authorName: String?
  var authorURL: String?
  var type: String?
  var height: Int?
  var width: Int?
  var version: String?
  var providerName: String?
  var providerURL: String?
  var thumbnailHeight: Int?
  var thumbnailWidth: Int?
  var thumbnailURL: String?
  var html: String?
}

extension OEmbed {
  static func url(id:String) -> URL? {
    URL(string: "https://www.youtube.com/oembed?url=http%3A//youtube.com/watch%3Fv%3D\(id)&format=json")
  }
}

extension OEmbed {
  enum OEmbedError : Error {
    case invalidURL
  }

  static func fetch(id:String) async throws -> OEmbed {
    guard let url = url(id:id) else {
      throw OEmbedError.invalidURL
    }

    let (data, _) = try await URLSession.shared.data(from: url)

    return try JSONDecoder().decode(OEmbed.self, from: data)
  }

}
