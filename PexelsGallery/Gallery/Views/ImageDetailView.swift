//
//  ImageDetailView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import SwiftUI

struct ImageDetailView: View {
    
    @State private var showInfoSheet = false
    let image: PexelsImageModel

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image.src.original)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Text("Loading image...")
                    .foregroundColor(.gray)
                ProgressView()
            }
        }
        .navigationTitle("Image Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showInfoSheet = true
                } label: {
                    Image(systemName: "info.circle")
                }
            }
        }
        .sheet(isPresented: $showInfoSheet) {
            ImageInfoSheet(image: image)
                .presentationDetents([.fraction(0.35)])
        }
    }
}
