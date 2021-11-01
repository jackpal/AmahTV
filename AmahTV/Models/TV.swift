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
}
