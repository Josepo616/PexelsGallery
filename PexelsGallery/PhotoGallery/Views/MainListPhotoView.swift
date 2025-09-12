//
//  MainListPhotoView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import SwiftUI

struct MainListPhotoView: View {
    
    @ObservedObject var imagesViewModel: PexelsImageViewModel
    
    var body: some View {
        GenericMainListView(
            viewModel: imagesViewModel,
            contentView: { vm, selectedID in
                MainListPhotoContentview(
                    imagesViewModel: vm as! PexelsImageViewModel,
                    selectedImageID: selectedID
                )
            },
            destinationView: { imageID, items in
                ImageDestinationView(
                    imageID: imageID,
                    images: items
                )
            }
        )
    }
}

