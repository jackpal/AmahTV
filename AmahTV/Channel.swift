//
//  Channels.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import Foundation

struct Channel {
  var name: String
  var url: URL
}

extension Channel {
  static let channels = [
    Channel(name: "民視新聞直播", url: URL(string: "https://www.youtube.com/watch?v=TCnaIE_SAtM")!),
    Channel(name: "民視新聞", url: URL(string: "https://www.youtube.com/watch?v=XxJKnDLYZz4")!),
    Channel(name: "三立 LIVE 新聞直播", url: URL(string:"https://www.youtube.com/watch?v=pJ0VgJloR9E")!),
    Channel(name: "東森新聞", url: URL(string:"https://www.youtube.com/watch?v=IbVnkfVCHRw&list=PLp7hnLHxd1KHiqXmhl4HJWPptOVGzZo2k&t=87s")!)
  ]
}
