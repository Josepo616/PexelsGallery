//
//  ImageGridView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import SwiftUI

struct ImageGridView: View {
    let images: [PexelsImageModel]
    let onImageTap: (Int) -> Void
    let loadMore: () -> Void

    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]) {
            ForEach(images.indices, id: \.self) { index in
                let image = images[index]

                VStack {
                    AsyncImage(url: URL(string: image.src.medium)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                    }

                    Text(image.photographer)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .onTapGesture {
                    onImageTap(image.id)
                }
                .onAppear {
                    if index == images.count - 1 {
                        loadMore()
                    }
                }
            }
        }
    }
}
