//
//  MainListPhotoView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

struct MainListPhotoView: View {

    @ObservedObject var imagesViewModel: PexelsImageViewModel
    @State private var selectedImageID: Int? = nil

    var body: some View {
        NavigationStack {
            MainListPhotoContentview(
                imagesViewModel: imagesViewModel,
                selectedImageID: $selectedImageID
            )
            .navigationTitle("Pexels Gallery")
            .navigationDestination(item: $selectedImageID) { imageID in
                ImageDestinationView(imageID: imageID, images: imagesViewModel.items)
            }
        }
        .alert("Error", isPresented: $imagesViewModel.showAlert) {
            Button("OK") {
                imagesViewModel.error = nil
                imagesViewModel.showAlert = false
            }
            Button("Exit", role: .cancel) {
                exit(0)
            }
        } message: {
            Text(imagesViewModel.error?.localizedDescription ?? "Unknown error")
        }
    }
}
