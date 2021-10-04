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
    VStack{
      HStack {
        ForEach(channels, id:\.name) {channel in
          Button(action: {
            choose(channel:channel)
          }) {
            HStack {
              if channel == selectedChannel {
                Image(systemName: "play.fill")
              }
              Text(channel.name)
            }
          }
          .padding()
        }
      }
      YouTubePlayerView(
        youTubePlayer
      )
    }
    .statusBar(hidden: true)
    .onAppear {
      choose(channel:channels[1])
    }
  }

  private func choose(channel:Channel) {
    youTubePlayer.source = .url(channel.url.absoluteString)
    selectedChannel = channel
  }
}

struct YouTubeView_Previews: PreviewProvider {
  static var previews: some View {
    YouTubeView()
  }
}
