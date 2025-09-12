//
//  ImagesScrollView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct VideosScrollView: View {

    @ObservedObject var viewModel2: PexelsVideoViewModel
    @Binding var selectedVideoID: Int?

    var body: some View {
        ScrollView {
            VideosGridView(
                videos: viewModel2.videos,
                onVideoTap: { id in selectedVideoID = id },
                loadMore: {
                    Task {
                        await viewModel2.fetchVideos(isLoadMore: true)
                    }
                }
            )

            switch viewModel2.loadingState {
            case .loadingMore:
                LoadingView(viewModel2: viewModel2)
            case .error:
                RefreshView(viewModel2: viewModel2)
                    .padding()
            default:
                EmptyView()
            }
        }
        .onAppear(perform: loadInitialImagesIfNeeded)
    }

    private func loadInitialImagesIfNeeded() {
        if viewModel2.videos.isEmpty
            && viewModel2.loadingState == .initialLoading
        {
            Task {
                await viewModel2.fetchVideos()
            }
        }
    }
}
