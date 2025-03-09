//
//  YouTubeView.swift
//  AmahTV
//
//  Created by Jack Palevich on 10/3/21.
//

import SwiftUI
import YouTubePlayerKit

struct YouTubeView: View {
  public var video: Video
  
  @State private var resetCount: Int = 0
  
  @Environment(\.youTubePlayer) var youTubePlayer
  
  var body: some View {
    YouTubePlayerView(youTubePlayer)
    .onChange(of:video) {
        Task {
            try? await youTubePlayer.load(source:.video(id: video.id))
        }
    }
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
      // Work around black-screen-after-overnight bug.
      reloadPlayer()
    }
    .onAppear {
        Task {
            try? await youTubePlayer.load(source:.video(id: video.id))
        }
    }
  }
  
  private func reloadPlayer() {
    resetCount += 1
    if let referrerURL = youTubePlayer.parameters.referrerURL {
      youTubePlayer.parameters.referrerURL = updateQueryParameter(in: referrerURL, parameterName: "resetCount", parameterValue: String(resetCount))
    }
  }

  static var language: String? {
    Locale.autoupdatingCurrent.identifier
  }

}


private func updateQueryParameter(in url: URL, parameterName: String, parameterValue: String) -> URL? {
    guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
        print("Error: Invalid URL") // Should theoretically not happen if you have a valid URL object
        return nil // Or throw an error if you prefer
    }

    var queryItems = urlComponents.queryItems ?? []

    // Check if the parameter already exists
    var parameterExists = false
    for (index, item) in queryItems.enumerated() {
        if item.name == parameterName {
            queryItems[index].value = parameterValue // Update existing parameter
            parameterExists = true
            break
        }
    }

    // If the parameter doesn't exist, add it
    if !parameterExists {
        queryItems.append(URLQueryItem(name: parameterName, value: parameterValue))
    }

    urlComponents.queryItems = queryItems

    return urlComponents.url
}
