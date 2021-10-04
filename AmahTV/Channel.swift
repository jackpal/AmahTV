//
//  Channels.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import Foundation

struct Channel : Equatable, Identifiable {
  var name: String
  var url: URL

  var id: String {
    name
  }
}

extension Channel {
  static let channels = [
    Channel(name: "中視新聞", url: URL(string: "https://www.youtube.com/watch?v=TCnaIE_SAtM")!),
    Channel(name: "民視新聞", url: URL(string: "https://www.youtube.com/watch?v=XxJKnDLYZz4")!),
    Channel(name: "三立 LIVE 新聞直播", url: URL(string:"https://www.youtube.com/watch?v=pJ0VgJloR9E")!),
    Channel(name: "東森財經", url: URL(string:"https://www.youtube.com/watch?v=zNESDscyCmk")!),
    Channel(name: "東森新聞", url: URL(string:"https://www.youtube.com/watch?v=IbVnkfVCHRw&list=PLp7hnLHxd1KHiqXmhl4HJWPptOVGzZo2k&t=87s")!),
    Channel(name: "年代新聞", url: URL(string:"https://www.youtube.com/watch?v=zarN1fpJv4Q&list=PLbyorRThEk_LCt0VzPS8KHsaTI0Y8dboO&t=48s")!)

  ]
}
