//
//  ImageDestinationView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct ImageDestinationView: View {
    
    let imageID: Int
    let images: [PexelsImageModel]

    var body: some View {
        GenericDestinationView(id: imageID, items: images, itemType: "Image") { image in
            ImageDetailView(image: image)
        }
    }
}
