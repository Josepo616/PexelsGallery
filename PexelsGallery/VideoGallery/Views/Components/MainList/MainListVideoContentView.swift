//
//  MainListVideoContentView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct MainListVideoContentView: View {
    
    @ObservedObject var viewModel2: PexelsVideoViewModel
    @Binding var selectedVideoID: Int?

    var body: some View {
        switch viewModel2.loadingState {
        case .initialLoading:
            LoadingView(viewModel2: viewModel2)

        case .loadingMore, .loaded, .error:
            if viewModel2.videos.isEmpty {
                if viewModel2.loadingState == .error {
                    RefreshView(viewModel2: viewModel2)
                } else {
                    EmptyVideosView()
                }
            } else {
                VideosScrollView(
                    viewModel2: viewModel2,
                    selectedVideoID: $selectedVideoID
                )
            }

        case .empty:
            EmptyVideosView()
        }
    }
}
