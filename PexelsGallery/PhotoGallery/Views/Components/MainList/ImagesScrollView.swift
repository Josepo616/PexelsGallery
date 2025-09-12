//
//  ImagesScrollView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct ImagesScrollView: View {

    @ObservedObject var imagesViewModel: PexelsImageViewModel
    @Binding var selectedImageID: Int?

    var body: some View {
        ScrollView {
            ImageGridView(
                images: imagesViewModel.items,
                onImageTap: { id in selectedImageID = id },
                loadMore: {
                    Task {
                        await imagesViewModel.fetchItems(isLoadMore: true)
                    }
                }
            )

            switch imagesViewModel.loadingState {
            case .loadingMore:
                LoadingView(imagesViewModel: imagesViewModel)
            case .error:
                RefreshView(imagesViewModel: imagesViewModel)
                    .padding()
            default:
                EmptyView()
            }
        }
        .onAppear(perform: loadInitialImagesIfNeeded)
    }

    private func loadInitialImagesIfNeeded() {
        if imagesViewModel.items.isEmpty && imagesViewModel.loadingState == .initialLoading
        {
            Task {
                await imagesViewModel.fetchItems()
            }
        }
    }
}
