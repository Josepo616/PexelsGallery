//
//  MainListVideoContentView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct MainListVideoContentView: View {
    
    @ObservedObject var videosViewModel: PexelsVideoViewModel
    @Binding var selectedVideoID: Int?

    var body: some View {
        switch videosViewModel.loadingState {
        case .initialLoading:
            LoadingView(videosViewModel: videosViewModel)

        case .loadingMore, .loaded, .error:
            if videosViewModel.items.isEmpty {
                if videosViewModel.loadingState == .error {
                    RefreshView(videosViewModel: videosViewModel)
                } else {
                    EmptyVideosView()
                }
            } else {
                VideosScrollView(
                    videosViewModel: videosViewModel,
                    selectedVideoID: $selectedVideoID
                )
            }

        case .empty:
            EmptyVideosView()
        }
    }
}
