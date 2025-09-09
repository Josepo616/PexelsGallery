//
//  ContentView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: PexelsViewModel
    @State private var selectedImageID: Int? = nil

    var body: some View {
        NavigationStack {
            ScrollView {
                ImageGridView(
                    images: viewModel.images,
                    onImageTap: { id in selectedImageID = id },
                    loadMore: {
                        Task {
                            await viewModel.fetchImages(isLoadMore: true)
                        }
                    }
                )
            }

            .navigationTitle("Pexels Gallery")
            .onAppear {
                Task {
                    await viewModel.fetchImages()
                }
            }
            .alert(isPresented: .constant(viewModel.error != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(
                        viewModel.error?.localizedDescription ?? "Unknown error"
                    ),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationDestination(item: $selectedImageID) { imageID in
                if let image = viewModel.images.first(where: { $0.id == imageID }) {
                    ImageDetailView(image: image)
                } else {
                    Text("Image not found")
                }
            }
        }
    }
}
