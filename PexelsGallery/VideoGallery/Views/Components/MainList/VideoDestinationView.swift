//
//  ImageDestinationView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct VideoDestinationView: View {

    let videoID: Int
    let videos: [PexelsVideoModel]

    var body: some View {
        if let video = videos.first(where: { $0.id == videoID }) {
            VideoDetailView(video: video)
        } else {
            Text("Video not found")
        }
    }
}
