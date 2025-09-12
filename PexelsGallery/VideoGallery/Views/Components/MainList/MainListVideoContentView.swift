//
//  MainListVideoContentView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct MainListVideoContentView: View {

    @ObservedObject var videosViewModel: PexelsVideoViewModel
    @Binding var selectedVideoID: Int?

    var body: some View {
        GenericContentView(
            viewModel: videosViewModel,
            selectedID: $selectedVideoID,
            grid: {
                GenericGridScrollView(
                    viewModel: videosViewModel,
                    selectedID: $selectedVideoID,
                    message: "Loading videos...",
                    retryMessage: "Retry loading videos..."

                ) { video in
                    AsyncImage(url: URL(string: video.image)) { img in
                        img.resizable().frame(width: 150, height: 180)
                    } placeholder: {
                        ProgressView().frame(height: 200)
                    }
                }
            },
            empty: {
                GenericEmptyStateView(
                    message: "No videos found.",
                    systemImage: "video"
                )
            },
            loadingMessage: "Loading videos...",
            retryMessage: "Retry loading videos."
        )
    }
}
