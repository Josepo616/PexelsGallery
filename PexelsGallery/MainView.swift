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
            NavigationView {
                MainListPhotoView(imagesViewModel: imagesViewModel)
                    .onAppear {
                        Task {
                            await imagesViewModel.fetchImages()
                        }
                    }
            }
            .tabItem {
                Label("Photos", systemImage: "photo")
            }

            NavigationView {
                MainListVideoView(videosViewModel: videosViewModel)
                    .onAppear {
                        Task {
                            await videosViewModel.fetchVideos()
                        }
                    }
            }
            .tabItem {
                Label("Videos", systemImage: "video")
            }
        }
    }
}
