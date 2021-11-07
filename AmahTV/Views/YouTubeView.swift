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
    .onChange(of:video) { newValue in
      youTubePlayer.source = .url(newValue.url.absoluteString)
    }
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
      // Work around black-screen-after-overnight bug.
      reloadPlayer()
    }
    .onAppear {
      youTubePlayer.source = .url(video.url.absoluteString)
      youTubePlayer.configuration = YouTubeView.configuration
    }
    .statusBar(hidden: true)
    .preferredColorScheme(.dark)
  }
  
  private func reloadPlayer() {
    resetCount += 1
    var config = YouTubeView.configuration
    config.referrer! += "?resetCount=\(resetCount)"
    youTubePlayer.configuration = config
  }

  static var language: String? {
    Locale.autoupdatingCurrent.identifier
  }

  static var configuration: YouTubePlayer.Configuration {
    YouTubePlayer.Configuration(
      autoPlay:true,
      captionLanguage: language,
      showFullscreenButton: false,
      language: language,
      showAnnotations: false,
      useModestBranding: true,
      // playInline: true,
      referrer: "https://amahtv.palevichchenindustries.com/"
    )
  }
}
