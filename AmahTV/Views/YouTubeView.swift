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
  
  @Environment(\.youTubePlayer) var youTubePlayer
  
  var body: some View {
    VStack {
      YouTubePlayerView(youTubePlayer)
      .onChange(of:channel) { newValue in
        youTubePlayer.source = .url(newValue.url.absoluteString)
      }
      .onAppear {
        youTubePlayer.source = .url(channel.url.absoluteString)
        youTubePlayer.configuration = YouTubeView.configuration
      }
    }
    .statusBar(hidden: true)
    .preferredColorScheme(.dark)
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
