//
//  AmahTVApp.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI

@main
struct AmahTVApp: App {

    var body: some Scene {
        WindowGroup {
          YouTubeView(channels:Channel.channels, initialSelectedChannelIndex: 1)
        }
    }
}
