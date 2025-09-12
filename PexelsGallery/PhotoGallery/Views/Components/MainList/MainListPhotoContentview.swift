//
//  MainListPhotoContentview.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct MainListPhotoContentview: View {

    @ObservedObject var imagesViewModel: PexelsImageViewModel
    @Binding var selectedImageID: Int?

    var body: some View {
        switch imagesViewModel.loadingState {
        case .initialLoading:
            LoadingView(imagesViewModel: imagesViewModel)

        case .loadingMore, .loaded, .error:
            if imagesViewModel.items.isEmpty {
                if imagesViewModel.loadingState == .error {
                    RefreshView(imagesViewModel: imagesViewModel)
                } else {
                    EmptyImagesView()
                }
            } else {
                ImagesScrollView(
                    imagesViewModel: imagesViewModel,
                    selectedImageID: $selectedImageID
                )
            }

        case .empty:
            EmptyImagesView()
        }
    }
}
