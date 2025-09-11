//
//  PexelsGalleryApp.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

@main
struct PexelsGalleryApp: App {
    
    @StateObject private var viewModel = PexelsImageViewModel()
    @StateObject private var viewModel2 = PexelsVideoViewModel()

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel, viewModel2: viewModel2)
        }
    }
}
