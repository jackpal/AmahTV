//
//  TV.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/31/21.
//

import Foundation

class TV : ObservableObject {
  @Published var selectedChannelIndex: Int = 1
  @Published var channels: Channels = Channel.channels

  var channel: Channel {
    channels[min(channels.count-1,max(0,selectedChannelIndex))]
  }

  private struct TVState : Codable {
    var selectedChannelIndex : Int
    var channels: Channels
  }

  func load() {
    guard let data = UserDefaults.standard.data(forKey: "tv"),
          let state = try?  JSONDecoder().decode(TVState.self, from: data) else {
      return
    }
    selectedChannelIndex = state.selectedChannelIndex
    channels = state.channels
  }

  func save() {
    let state = TVState(selectedChannelIndex: selectedChannelIndex, channels: channels)
    guard let data = try? JSONEncoder().encode(state) else { return }
    UserDefaults.standard.set(data, forKey: "tv")
  }
}
