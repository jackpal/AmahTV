//
//  String+videoID.swift
//  AmahTV
//
//  Created by Jack Palevich on 11/1/21.
//

import Foundation

extension String {
  var videoID : String? {
    // TODO: resolve the URL to handle URL shorteners.
    if let url = URL(string: self),
       let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
       let queryItems = components.queryItems,
       let v = queryItems.first(where: {$0.name == "v"}) {
      return v.value
    }
    // Currently all the video IDs are of count 11, but that may change someday.
    if self.count == 11 {
      return self
    }
    return nil
  }
}
