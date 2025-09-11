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
        if let image = images.first(where: { $0.id == imageID }) {
            ImageDetailView(image: image)
        } else {
            Text("Image not found")
        }
    }
}
