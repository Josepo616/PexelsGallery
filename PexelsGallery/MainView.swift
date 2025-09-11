//
//  MainScreen.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct MainView: View {
    
    var viewModel: PexelsImageViewModel
    var viewModel2: PexelsVideoViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                MainListPhotoView(viewModel: viewModel)
                    .onAppear {
                        Task {
                            await viewModel.fetchImages()
                        }
                    }
            }
            .tabItem {
                Label("Photos", systemImage: "photo")
            }

            NavigationView {
                MainListVideoView(viewModel2: viewModel2)
                    .onAppear {
                        Task {
                            await viewModel2.fetchVideos()
                        }
                    }
            }
            .tabItem {
                Label("Videos", systemImage: "video")
            }
        }
    }
}
