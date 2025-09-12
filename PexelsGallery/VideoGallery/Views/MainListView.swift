//
//  MainListVideoView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

struct MainListVideoView: View {

    @ObservedObject var videosViewModel: PexelsVideoViewModel
    @State private var selectedVideoID: Int? = nil

    var body: some View {
        NavigationStack {
            MainListVideoContentView(
                videosViewModel: videosViewModel,
                selectedVideoID: $selectedVideoID
            )
            .navigationTitle("Pexels Gallery")
            .navigationDestination(item: $selectedVideoID) { videoID in
                VideoDestinationView(
                    videoID: videoID,
                    videos: videosViewModel.items
                )
            }
        }
        .alert("Error", isPresented: $videosViewModel.showAlert) {
            Button("OK") {
                videosViewModel.error = nil
                videosViewModel.showAlert = false
            }
            Button("Exit", role: .cancel) {
                exit(0)
            }
        } message: {
            Text(videosViewModel.error?.localizedDescription ?? "Unknown error")
        }
    }
}
