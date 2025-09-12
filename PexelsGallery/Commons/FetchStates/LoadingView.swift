//
//  LoadingView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/10/25.
//

import SwiftUI

struct LoadingView: View {

    var imagesViewModel: PexelsImageViewModel?
    var videosViewModel: PexelsVideoViewModel?

    var body: some View {
        VStack {
            if imagesViewModel != nil {
                Text("Loading images...")
                    .foregroundColor(.gray)
            } else if videosViewModel != nil {
                Text("Loading videos...")
                    .foregroundColor(.gray)
            } else {
                Text("Loading...")
                    .foregroundColor(.gray)
            }
            ProgressView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
