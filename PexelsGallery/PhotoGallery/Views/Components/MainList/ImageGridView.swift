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
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
            ForEach(images.indices, id: \.self) { index in
                let image = images[index]
                VStack {
                    AsyncImage(url: URL(string: image.src.medium)) { image in
                        image
                            .resizable()
                            .frame(width: 150, height: 180)
                            .cornerRadius(8)
                            .shadow(
                                color: .black.opacity(0.1),
                                radius: 4,
                                x: 0,
                                y: 2
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(
                                        Color.gray.opacity(0.3),
                                        lineWidth: 1
                                    )
                            )
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                    }
                }
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
