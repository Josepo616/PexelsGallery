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
        GenericDestinationView(id: videoID, items: videos, itemType: "Video") { video in
            VideoDetailView(video: video)
        }
    }
}
