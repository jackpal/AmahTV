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
  @StateObject
  private var youTubePlayer = YouTubePlayer()

  var body: some View {
    HStack {
      List(channels, id:\.name) {channel in
        Button(channel.name) {
          youTubePlayer.source = .url(channel.url.absoluteString)
        }
      }
      .frame(maxWidth:200)
      YouTubePlayerView(
        youTubePlayer
      )
    }
  }
}

struct YouTubeView_Previews: PreviewProvider {
  static var previews: some View {
    YouTubeView()
  }
}
