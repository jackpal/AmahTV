//
//  YouTubeView.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI
import YouTubePlayerKit

struct YouTubeView: View {
  private let channels: [Channel]
  @State
  private var selectedChannel: Channel
  
  @StateObject
  private var youTubePlayer: YouTubePlayer
  
  init(channels: [Channel], initialSelectedChannelIndex: Int) {
    self.channels = channels
    let selectedChannel = channels[initialSelectedChannelIndex]
    _selectedChannel = State(wrappedValue:selectedChannel)
    _youTubePlayer =
    StateObject(
      wrappedValue:
        YouTubePlayer(
          source:.url(selectedChannel.url.absoluteString),
          configuration: .init(
            autoPlay:true,
            captionLanguage: "zh-Hant",
            showFullscreenButton: false,
            language: "zh-Hant",
            showAnnotations: false,
            useModestBranding: true
          )
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
      .background(Color.black)
      .onChange(of:selectedChannel) { newValue in
        youTubePlayer.source = .url(newValue.url.absoluteString)
      }
      
      YouTubePlayerView(
        youTubePlayer
      )
      
    }
    .statusBar(hidden: true)
    .preferredColorScheme(.dark)
  }
}
