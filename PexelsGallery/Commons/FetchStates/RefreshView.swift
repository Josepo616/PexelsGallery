//
//  RefreshView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/10/25.
//

import SwiftUI

struct RefreshView: View {
    
    var viewModel: PexelsImageViewModel?
    var viewModel2: PexelsVideoViewModel?

    var body: some View {
        VStack(spacing: 16) {
            Text("Failed to load content.")
                .foregroundColor(.red)
            Button("Retry") {
                Task {
                    if let imageVM = viewModel {
                        await imageVM.fetchImages(
                            preserveData: !imageVM.images.isEmpty
                        )
                    }
                    if let videoVM = viewModel2 {
                        await videoVM.fetchVideos(
                            preserveData: !videoVM.videos.isEmpty
                        )
                    }
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
