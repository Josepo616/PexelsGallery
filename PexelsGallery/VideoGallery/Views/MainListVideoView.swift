//
//  MainListVideoView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

struct MainListVideoView: View {
    
    @ObservedObject var videosViewModel: PexelsVideoViewModel
    
    var body: some View {
        GenericMainListView(
            viewModel: videosViewModel,
            contentView: { vm, selectedID in
                MainListVideoContentView(
                    videosViewModel: vm as! PexelsVideoViewModel,
                    selectedVideoID: selectedID 
                )
            },
            destinationView: { videoID, items in
                VideoDestinationView(
                    videoID: videoID,
                    videos: items 
                )
            }
        )
    }
}
