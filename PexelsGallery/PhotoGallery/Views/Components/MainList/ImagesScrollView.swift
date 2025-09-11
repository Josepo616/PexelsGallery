//
//  ImagesScrollView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI
struct ImagesScrollView: View {
    
    @ObservedObject var viewModel: PexelsImageViewModel
    @Binding var selectedImageID: Int?

    var body: some View {
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

            switch viewModel.loadingState {
            case .loadingMore:
                LoadingView(viewModel: viewModel)
            case .error:
                RefreshView(viewModel: viewModel)
                    .padding()
            default:
                EmptyView()
            }
        }
        .onAppear(perform: loadInitialImagesIfNeeded)
    }

    private func loadInitialImagesIfNeeded() {
        if viewModel.images.isEmpty && viewModel.loadingState == .initialLoading {
            Task {
                await viewModel.fetchImages()
            }
        }
    }
}
