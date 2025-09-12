//
//  PexelsGalleryApp.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

@main
struct PexelsGalleryApp: App {
    
    @StateObject private var imagesViewModel = PexelsImageViewModel()
    @StateObject private var videosViewModel = PexelsVideoViewModel()

    var body: some Scene {
        WindowGroup {
            MainView(imagesViewModel: imagesViewModel, videosViewModel: videosViewModel)
        }
    }
}
