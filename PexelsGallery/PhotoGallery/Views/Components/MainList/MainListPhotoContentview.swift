//
//  MainListPhotoContentview.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct MainListPhotoContentview: View {

    @ObservedObject var viewModel: PexelsImageViewModel
    @Binding var selectedImageID: Int?

    var body: some View {
        switch viewModel.loadingState {
        case .initialLoading:
            LoadingView(viewModel: viewModel)

        case .loadingMore, .loaded, .error:
            if viewModel.images.isEmpty {
                if viewModel.loadingState == .error {
                    RefreshView(viewModel: viewModel)
                } else {
                    EmptyImagesView()
                }
            } else {
                ImagesScrollView(
                    viewModel: viewModel,
                    selectedImageID: $selectedImageID
                )
            }

        case .empty:
            EmptyImagesView()
        }
    }
}
