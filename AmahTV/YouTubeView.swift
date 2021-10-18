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

  @Binding private var selectedChannelIndex: Int

  private var selectedChannel: Channel {
    channels[max(0,min(selectedChannelIndex, channels.count-1))]
  }
  
  @StateObject
  private var youTubePlayer: YouTubePlayer = YouTubePlayer()
  
  @State
  private var state: YouTubePlayer.State? = nil
  
  @State
  private var playbackState: YouTubePlayer.PlaybackState? = nil
  
  @State
  private var resetCount: Int = 0
  
  init(channels: [Channel], selectedChannelIndex: Binding<Int>) {
    self.channels = channels
    _selectedChannelIndex = selectedChannelIndex
  }
  
  var body: some View {
    VStack {
      Picker(selection: $selectedChannelIndex, label: Text("Channel")) {
        ForEach(Array(channels.enumerated()), id: \.1) {index, channel in
          Text(channel.name)
            .tag(index)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      .onChange(of:selectedChannel) { newValue in
        youTubePlayer.source = .url(newValue.url.absoluteString)
      }
      YouTubePlayerView(
        youTubePlayer
      )
      .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
        // Work around black-screen-after-overnight bug.
        reloadPlayer()
      }
      .onAppear {
        youTubePlayer.source = .url(selectedChannel.url.absoluteString)
        youTubePlayer.configuration = YouTubeView.configuration
      }
      HStack {
        Text("\(state?.description ?? "nil")")
          .onReceive(youTubePlayer.statePublisher) { s in
            state = s
          }
        Text("\(playbackState?.description ?? "nil")")
          .onReceive(youTubePlayer.playbackStatePublisher) { s in
            playbackState = s
          }
        Text("\(resetCount)")
        Button("Reload") {
          reloadPlayer()
        }
        Spacer()
      }
    }
    .statusBar(hidden: true)
    .preferredColorScheme(.dark)
    .edgesIgnoringSafeArea(.bottom)
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
