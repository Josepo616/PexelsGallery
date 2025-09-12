//
//  MainListVideoView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

struct MainListVideoView: View {

    @ObservedObject var viewModel2: PexelsVideoViewModel
    @State private var selectedVideoID: Int? = nil

    var body: some View {
        NavigationStack {
            MainListVideoContentView(
                viewModel2: viewModel2,
                selectedVideoID: $selectedVideoID
            )
            .navigationTitle("Pexels Gallery")
            .navigationDestination(item: $selectedVideoID) { videoID in
                VideoDestinationView(
                    videoID: videoID,
                    videos: viewModel2.videos
                )
            }
        }
        .alert("Error", isPresented: $viewModel2.showAlert) {
            Button("OK") {
                viewModel2.error = nil
                viewModel2.showAlert = false
            }
            Button("Exit", role: .cancel) {
                exit(0)
            }
        } message: {
            Text(viewModel2.error?.localizedDescription ?? "Unknown error")
        }
    }
}
