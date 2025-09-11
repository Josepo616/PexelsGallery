//
//  ImageDetailView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import SwiftUI
import AVKit

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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showInfoSheet = true
                } label: {
                    Image(systemName: "info.circle")
                }
            }
        }
        .onAppear {
            if let videoURLString = video.videoFiles.first(where: { $0.quality == "hd"})?.link, let url = URL(string: videoURLString) {
                print("URL created:", url)
                player = AVPlayer(url: url)
            } else {
                print("struct:", video)
                print("ERROR: videoURL is nil or invalid")
            }
        }
        .sheet(isPresented: $showInfoSheet) {
            // Aquí puedes mostrar más info del video
            Text("Información del video")
        }
    }
}
