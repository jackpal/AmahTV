import Foundation

extension URL {
  
  // Resolve a potentially redirected URL, as for example from a URL shortener.
  func resolve() async throws -> URL {
    let originalURL = self
    var req = URLRequest(url: originalURL)
    req.httpMethod = "HEAD"

    let (_, response) = try await URLSession.shared.data(for:req)
    return response.url ?? originalURL
  }

}
