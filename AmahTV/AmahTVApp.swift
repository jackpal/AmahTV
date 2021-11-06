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

  init() {
    UISegmentedControl.appearance().setTitleTextAttributes(
      [
        .font: UIFont.systemFont(ofSize: 18),
      ], for: .normal)
  }
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(tv)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
          tv.save()
        }
        .onAppear {
          tv.load()
        }
    }
  }
}
