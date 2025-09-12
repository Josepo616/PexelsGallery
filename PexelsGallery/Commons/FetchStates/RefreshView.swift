//
//  RefreshView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/10/25.
//

import SwiftUI

struct RefreshView: View {
    
    var imagesViewModel: PexelsImageViewModel?
    var videosViewModel: PexelsVideoViewModel?

    var body: some View {
        VStack(spacing: 16) {
            Text("Failed to load content.")
                .foregroundColor(.red)
            Button("Retry") {
                Task {
                    if let imageVM = imagesViewModel {
                        await imageVM.fetchItems(
                            preserveData: !imageVM.items.isEmpty
                        )
                    }
                    if let videoVM = videosViewModel {
                        await videoVM.fetchItems(
                            preserveData: !videoVM.items.isEmpty
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
