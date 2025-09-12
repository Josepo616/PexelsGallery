//
//  ImagesScrollView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct VideosScrollView: View {

    @ObservedObject var videosViewModel: PexelsVideoViewModel
    @Binding var selectedVideoID: Int?

    var body: some View {
        ScrollView {
            VideosGridView(
                videos: videosViewModel.items,
                onVideoTap: { id in selectedVideoID = id },
                loadMore: {
                    Task {
                        await videosViewModel.fetchItems(isLoadMore: true)
                    }
                }
            )

            switch videosViewModel.loadingState {
            case .loadingMore:
                LoadingView(videosViewModel: videosViewModel)
            case .error:
                RefreshView(videosViewModel: videosViewModel)
                    .padding()
            default:
                EmptyView()
            }
        }
        .onAppear(perform: loadInitialImagesIfNeeded)
    }

    private func loadInitialImagesIfNeeded() {
        if videosViewModel.items.isEmpty
            && videosViewModel.loadingState == .initialLoading
        {
            Task {
                await videosViewModel.fetchItems()
            }
        }
    }
}
