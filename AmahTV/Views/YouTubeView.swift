//
//  YouTubeView.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI
import YouTubePlayerKit

struct YouTubeView: View {
  public var video: Video
  
  @State private var resetCount: Int = 0
  
  @Environment(\.youTubePlayer) var youTubePlayer
  
  var body: some View {
    YouTubePlayerView(youTubePlayer)
    .onChange(of:video) {
        Task {
            try? await youTubePlayer.load(source:.video(id: video.id))
        }
    }
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
      // Work around black-screen-after-overnight bug.
      reloadPlayer()
    }
    .onAppear {
        Task {
            try? await youTubePlayer.load(source:.video(id: video.id))
        }
    }
  }
  
  private func reloadPlayer() {
//    resetCount += 1
//    var config = YouTubeView.configuration
//    config.referrer! += "?resetCount=\(resetCount)"
//    youTubePlayer.configuration = config
  }

  static var language: String? {
    Locale.autoupdatingCurrent.identifier
  }

}
