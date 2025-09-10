//
//  PexelsGalleryApp.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

@main
struct PexelsGalleryApp: App {
    @StateObject private var viewModel = PexelsViewModel()

    var body: some Scene {
        WindowGroup {
            MainListView(viewModel: viewModel)
                .onAppear {
                    Task {
                        await viewModel.fetchImages()
                    }
                }
        }
    }
}
