//
//  String+videoID.swift
//  AmahTV
//
//  Created by Jack Palevich on 11/1/21.
//

import Foundation

extension URL {
  var videoID : String? {
    if let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
       let queryItems = components.queryItems,
       let v = queryItems.first(where: {$0.name == "v"}) {
      return v.value
    }
    return nil
  }
}
