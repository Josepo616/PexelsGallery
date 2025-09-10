//
//  RefreshView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/10/25.
//

import SwiftUI

struct RefreshView: View {

    var viewModel: PexelsViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("Failed to load images.")
                .foregroundColor(.red)
            Button("Retry") {
                Task {
                    await viewModel.fetchImages(preserveData: !viewModel.images.isEmpty)
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

