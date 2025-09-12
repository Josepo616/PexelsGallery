//
//  MainScreen.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct MainView: View {
    
    var imagesViewModel: PexelsImageViewModel
    var videosViewModel: PexelsVideoViewModel
    
    var body: some View {
        TabView {
            NavigationStack {
                MainListPhotoView(imagesViewModel: imagesViewModel)
                    .onAppear {
                        Task {
                            if imagesViewModel.items.isEmpty {
                                await imagesViewModel.fetchItems()
                            }
                        }
                    }
            }
            .tabItem {
                Label("Photos", systemImage: "photo")
            }

            NavigationStack {
                MainListVideoView(videosViewModel: videosViewModel)
                    .onAppear {
                        Task {
                            if videosViewModel.items.isEmpty {
                                await videosViewModel.fetchItems()
                            }
                        }
                    }
            }
            .tabItem {
                Label("Videos", systemImage: "video")
            }
        }
    }
}
