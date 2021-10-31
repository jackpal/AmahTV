//
//  AmahTVApp.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI

@main
struct AmahTVApp: App {
  @AppStorage("selectedChannelIndex")
  private var selectedChannelIndex: Int = 1

  @AppStorage("channels")
  private var channels = Channel.channels

  var body: some Scene {
    WindowGroup {
      YouTubeView(channels:$channels, selectedChannelIndex: $selectedChannelIndex)
    }
  }
}
