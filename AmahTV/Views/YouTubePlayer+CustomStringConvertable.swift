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
