//
//  YouTubeView.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI
import YouTubePlayerKit

extension YouTubePlayer.State : CustomStringConvertible {
  public var description : String {
    switch self {
    case .idle:
      return "idle"
    case .ready:
      return "ready"
    case let .error(e):
      return "error(\(e))"
    }
  }
}

extension YouTubePlayer.PlaybackState : CustomStringConvertible {
  public var description : String {
    switch self {
    case .unstarted:
      return "unstarted"
    case .ended:
      return "ended"
    case .playing:
      return "playing"
    case .paused:
      return "paused"
    case .buffering:
      return "buffering"
    case .cued:
      return "cued"
    }
  }
}

struct YouTubeView: View {
  private let channels: [Channel]
  @State
  private var selectedChannel: Channel

  @StateObject
  private var youTubePlayer: YouTubePlayer

  @State
  private var state: YouTubePlayer.State? = nil

  @State
  private var playbackState: YouTubePlayer.PlaybackState? = nil

  init(channels: [Channel], initialSelectedChannelIndex: Int) {
    self.channels = channels
    let selectedChannel = channels[initialSelectedChannelIndex]
    _selectedChannel = State(wrappedValue:selectedChannel)
    _youTubePlayer =
    StateObject(
      wrappedValue:
        YouTubePlayer(
          source:.url(selectedChannel.url.absoluteString),
          configuration: YouTubeView.configuration
        )
    )
  }

  var body: some View {
    VStack {
      Picker(selection: $selectedChannel, label: Text("Channel")) {
        ForEach(channels) {channel in
          Text(channel.name)
            .tag(channel)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      .onChange(of:selectedChannel) { newValue in
        youTubePlayer.source = .url(newValue.url.absoluteString)
      }
      YouTubePlayerView(
        youTubePlayer
      )
      HStack {
        Text("\(state?.description ?? "nil")")
          .onReceive(youTubePlayer.statePublisher) { s in
            state = s
          }
        Text("\(playbackState?.description ?? "nil")")
          .onReceive(youTubePlayer.playbackStatePublisher) { s in
            playbackState = s
          }
      }
    }
    .statusBar(hidden: true)
    .preferredColorScheme(.dark)
    .edgesIgnoringSafeArea(.bottom)
  }

  static var configuration: YouTubePlayer.Configuration {
    YouTubePlayer.Configuration(
      autoPlay:true,
      captionLanguage: "zh-Hant",
      showFullscreenButton: false,
      language: "zh-Hant",
      showAnnotations: false,
      useModestBranding: true,
      playInline: true,
      referrer: "https://amahtv.palevichchenindustries.com/"
    )
  }
}
