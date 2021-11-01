//
//  YouTubeView.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI
import YouTubePlayerKit

struct YouTubeView: View {
  public var channel: Channel
  
  @StateObject
  private var youTubePlayer: YouTubePlayer = YouTubePlayer()
  
  @State
  private var resetCount: Int = 0
  
  var body: some View {
    VStack {
      YouTubePlayerView(
        youTubePlayer
      )
      .onChange(of:channel) { newValue in
        youTubePlayer.source = .url(newValue.url.absoluteString)
      }
      .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
        // Work around black-screen-after-overnight bug.
        reloadPlayer()
      }
      .onAppear {
        youTubePlayer.source = .url(channel.url.absoluteString)
        youTubePlayer.configuration = YouTubeView.configuration
      }
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
  
  static var configuration: YouTubePlayer.Configuration {
    YouTubePlayer.Configuration(
      autoPlay:true,
      captionLanguage: "zh-Hant",
      showFullscreenButton: false,
      language: "zh-Hant",
      showAnnotations: false,
      useModestBranding: true,
      // playInline: true,
      referrer: "https://amahtv.palevichchenindustries.com/"
    )
  }
}
