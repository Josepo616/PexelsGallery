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
            contentView
                .navigationTitle("Pexels Gallery")
                .navigationDestination(item: $selectedImageID) { imageID in
                    destinationView(for: imageID)
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

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.loadingState {
        case .initialLoading:
            LoadingView(viewModel: viewModel)

        case .loadingMore, .loaded, .error:
            if viewModel.images.isEmpty {
                if viewModel.loadingState == .error {
                    RefreshView(viewModel: viewModel)
                } else {
                    Text("No images found.")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } else {
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

                    if viewModel.loadingState == .loadingMore{
                        LoadingView(viewModel: viewModel)
                    } else if viewModel.loadingState == .error {
                        RefreshView(viewModel: viewModel)
                            .padding()
                    }
                }
                .onAppear(perform: loadInitialImagesIfNeeded)
            }

        case .empty:
            Text("No images found.")
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }


    @ViewBuilder
    private func destinationView(for imageID: Int) -> some View {
        if let image = viewModel.images.first(where: { $0.id == imageID }) {
            ImageDetailView(image: image)
        } else {
            Text("Image not found")
        }
    }
    
    private func loadInitialImagesIfNeeded() {
        if viewModel.images.isEmpty && viewModel.loadingState == .initialLoading {
            Task {
                await viewModel.fetchImages()
            }
        }
    }
}
