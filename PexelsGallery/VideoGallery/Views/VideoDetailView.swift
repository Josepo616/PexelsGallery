//
//  VideoDetailView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import AVKit
import SwiftUI

struct VideoDetailView: View {
    let video: PexelsVideoModel
    @State private var player: AVPlayer?
    @State private var showInfoSheet = false

    var body: some View {
        VStack {
            if let player = player {
                VideoPlayer(player: player)
                    .aspectRatio(contentMode: .fit)
                    .onAppear {
                        player.play()
                    }
            } else {
                Text("Loading video...")
                ProgressView()
            }
        }
        .navigationTitle("Video Detail")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if let videoURLString = video.videoFiles.first(where: {
                $0.quality == "hd"
            })?.link, let url = URL(string: videoURLString) {
                player = AVPlayer(url: url)
            }
        }
    }
}
