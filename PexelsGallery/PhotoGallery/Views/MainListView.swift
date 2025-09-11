//
//  MainListView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

struct MainListView: View {

    @ObservedObject var viewModel: PexelsViewModel
    @State private var selectedImageID: Int? = nil

    var body: some View {
        NavigationStack {
            MainListContentView(
                viewModel: viewModel,
                selectedImageID: $selectedImageID
            )
            .navigationTitle("Pexels Gallery")
            .navigationDestination(item: $selectedImageID) { imageID in
                ImageDestinationView(imageID: imageID, images: viewModel.images)
            }
        }
        .alert("Error", isPresented: $viewModel.showAlert) {
            Button("OK") {
                viewModel.error = nil
                viewModel.showAlert = false
            }
            Button("Exit", role: .cancel) {
                exit(0)
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "Unknown error")
        }
    }
}
