//
//  VideosGridView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import SwiftUI

struct VideosGridView: View {

    let videos: [PexelsVideoModel]
    let onVideoTap: (Int) -> Void
    let loadMore: () -> Void

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
            ForEach(videos.indices, id: \.self) { index in
                let video = videos[index]
                VStack {
                    AsyncImage(url: URL(string: video.image)) { image in
                        image
                            .resizable()
                            .frame(width: 150, height: 180)
                            .cornerRadius(8)
                            .shadow(
                                color: .black.opacity(0.1),
                                radius: 4,
                                x: 0,
                                y: 2
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(
                                        Color.gray.opacity(0.3),
                                        lineWidth: 1
                                    )
                            )
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                    }
                }
                .onTapGesture {
                    onVideoTap(video.id)
                }
                .onAppear {
                    if index == videos.count - 1 {
                        loadMore()
                    }
                }
            }
        }
    }
}
