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
    NavigationView {
      ChannelsView(channels:channels, youTubePlayer:youTubePlayer)
      Text("Swipe from left for channels")
    }.navigationTitle("Amah TV")
  }
}

struct ChannelsView: View {
  public let channels: [Channel]
  @ObservedObject
  public var youTubePlayer: YouTubePlayer
  var body: some View {
    List(channels, id:\.name) {channel in
      NavigationLink(destination:
                      YTView(url:channel.url, youTubePlayer:youTubePlayer)
                      .navigationTitle(Text(channel.name))
      ) {
        Text(channel.name)
      }
    }
  }
}

struct YTView: View {
  var url: URL
  @ObservedObject
  public var youTubePlayer: YouTubePlayer
  var body: some View {
    YouTubePlayerView(
      youTubePlayer
    )
      .onAppear {
          youTubePlayer.source = .url(url.absoluteString)
      }
      .onDisappear {
        youTubePlayer.stop()
      }
  }
}

struct YouTubeView_Previews: PreviewProvider {
  static var previews: some View {
    YouTubeView()
  }
}
