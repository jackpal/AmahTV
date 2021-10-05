//
//  AmahTVApp.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI

@main
struct AmahTVApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          YouTubeView(channels:Channel.channels, initialSelectedChannelIndex: 1)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
