//
//  URL+promoteToHTTPS.swift
//  AmahTV
//
//  Created by Jack Palevich on 11/2/21.
//

import Foundation

extension URL {
  var promoteToHTTPS : URL? {
    if self.scheme == "https" {
      return self
    }
    if let components = NSURLComponents(url:self, resolvingAgainstBaseURL: false) {
      components.scheme = "https"
      return components.url
    }
    return nil
  }
}
