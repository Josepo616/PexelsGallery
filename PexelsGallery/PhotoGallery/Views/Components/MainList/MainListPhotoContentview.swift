//
//  MainListPhotoContentview.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct MainListPhotoContentview: View {

    @ObservedObject var imagesViewModel: PexelsImageViewModel
    @Binding var selectedImageID: Int?

    var body: some View {
        GenericContentView(
            viewModel: imagesViewModel,
            selectedID: $selectedImageID,
            grid: {
                GenericGridScrollView(
                    viewModel: imagesViewModel,
                    selectedID: $selectedImageID,
                    message: "Loading images...",
                    retryMessage: "Retry loading images..."
                ) { image in
                    AsyncImage(url: URL(string: image.src.medium)) { img in
                        img.resizable().frame(width: 150, height: 180)
                    } placeholder: {
                        ProgressView().frame(height: 200)
                    }
                }
            },
            empty: {
                GenericEmptyStateView(
                    message: "No images found.",
                    systemImage: "photo"
                )
            },
            loadingMessage: "Loading images...",
            retryMessage: "Retry loading images."
        )
    }
}
