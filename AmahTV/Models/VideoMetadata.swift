import Foundation

/** For a given URL-like user input, finds the videoID, thumbnailURL, and title. */
class VideoMetadata : ObservableObject {
  @Published public var title: String?
  @Published public var thumbnailHeight: Int?
  @Published public var thumbnailWidth: Int?
  @Published public var thumbnailURL: URL?
  @Published public var videoID: String?

  private var task: Task<Void,Never>?

  func resolve(urlOrVideoID: String) {
    task?.cancel()
    videoID = nil
    task = Task.detached() {
      try? await self.process(urlOrVideoID:urlOrVideoID)
    }
  }

  private func process(urlOrVideoID: String) async throws {
    if let videoID = try await findVideoID(urlOrVideoID:urlOrVideoID) {
      DispatchQueue.main.async {
        self.objectWillChange.send()
        self.videoID = videoID
      }
      let oembed = try await OEmbed.fetch(id:videoID)
      DispatchQueue.main.async {
        self.objectWillChange.send()
        self.title = oembed.title
        self.thumbnailHeight = oembed.thumbnailHeight
        self.thumbnailWidth = oembed.thumbnailWidth
        if let thumbnailURL = oembed.thumbnailUrl {
          self.thumbnailURL = URL(string:thumbnailURL)
        }
      }
    }
  }

  private func findVideoID(urlOrVideoID: String) async throws -> String? {
    if let url = URL(string:urlOrVideoID),
       !(url.scheme?.isEmpty ?? true) {
      if let v = url.videoID {
        return v
      }
      let resolvedURL = try await url.resolve()
      return resolvedURL.videoID
    }
    // Currently all the video IDs are of count 11, but that may change someday.
    if urlOrVideoID.count == 11 {
      return urlOrVideoID
    }
    return nil
  }

}
