//
//  TV.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/31/21.
//

import Foundation

class TV : ObservableObject {
  @Published var selectedVideo: Int = 0
  @Published var videos: Videos = Video.videos

  var video: Video {
    videos[min(videos.count-1,max(0,selectedVideo))]
  }

  private struct TVState : Codable {
    var selectedVideoIndex : Int
    var videos: Videos
  }

  func load() {
    guard let data = UserDefaults.standard.data(forKey: "tv"),
          let state = try?  JSONDecoder().decode(TVState.self, from: data) else {
      return
    }
    selectedVideo = state.selectedVideoIndex
    videos = state.videos
  }

  func save() {
    let state = TVState(selectedVideoIndex: selectedVideo, videos: videos)
    guard let data = try? JSONEncoder().encode(state) else { return }
    UserDefaults.standard.set(data, forKey: "tv")
  }
}
