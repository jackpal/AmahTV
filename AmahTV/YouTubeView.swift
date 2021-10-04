//
//  YouTubeView.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI
import YouTubePlayerKit

struct YouTubeView: View {
  private let channels = Channel.channels
  @State
  private var selectedChannel: Channel?

  @StateObject
  private var youTubePlayer =
  YouTubePlayer(
    configuration: .init(
      captionLanguage: "zh-Hant",
      showFullscreenButton: false,
      language: "zh-Hant",
      showAnnotations: false,
      useModestBranding: true
      )
  )

  var body: some View {
    HStack {
      List(channels, id:\.name) {channel in
        Button(action: {
          youTubePlayer.source = .url(channel.url.absoluteString)
          selectedChannel = channel
        }) {
          HStack {
            Text(channel.name)
            Spacer()
            if channel == selectedChannel {
              Image(systemName: "play.fill")
            }
          }
        }
      }
      .frame(maxWidth:200)
      YouTubePlayerView(
        youTubePlayer
      )
    }
    .statusBar(hidden: true)
  }
}

struct YouTubeView_Previews: PreviewProvider {
  static var previews: some View {
    YouTubeView()
  }
}
