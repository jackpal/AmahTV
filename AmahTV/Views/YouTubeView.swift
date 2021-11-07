//
//  YouTubeView.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI
import SwiftUIYouTubePlayer

struct YouTubeView: View {
  public var video: Video
  
  @State private var action = YouTubePlayerAction.idle
  @State private var state = YouTubePlayerState.empty

  private var buttonText: String {
    switch state.status {
    case .playing:
      return "Pause"
    case .unstarted,  .ended, .paused:
      return "Play"
    case .buffering, .queued:
      return "Wait"
    }
  }
  private var infoText: String {
    "Q: \(state.quality)"
  }

  var body: some View {
    VStack {
      HStack {
        Button("Load") {
          action = .loadID(video.id)
        }
        Button(buttonText) {
          if state.status != .playing {
            action = .play
          } else {
            action = .pause
          }
        }
        Text(infoText)
        Button("Prev") {
          action = .previous
        }
        Button("Next") {
          action = .next
        }
      }
      YouTubePlayer(action: $action, state: $state)
      Spacer()
    }
  }
}

