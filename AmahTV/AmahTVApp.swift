//
//  AmahTVApp.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI

@main
struct AmahTVApp: App {
  @StateObject private var tv = TV()

  var body: some Scene {
    WindowGroup {
      WatchView(tv:tv)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
          tv.save()
        }
        .onAppear {
          tv.load()
        }
    }
  }
}
