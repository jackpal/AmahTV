import SwiftUI

struct VideoPicker: View {
  @Binding public var videos: Videos
  @Binding public var selectedVideoIndex: Int

  var body: some View {
      Picker(selection: $selectedVideoIndex, label: Text("Videos")) {
        ForEach(Array(videos.enumerated()), id: \.1) {index, video in
          Text(video.name)
            .tag(index)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
  }
}
