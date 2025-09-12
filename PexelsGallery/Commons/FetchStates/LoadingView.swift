//
//  LoadingView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/10/25.
//

import SwiftUI

struct LoadingView: View {

    var viewModel: PexelsImageViewModel?
    var viewModel2: PexelsVideoViewModel?

    var body: some View {
        VStack {
            if viewModel != nil {
                Text("Loading images...")
                    .foregroundColor(.gray)
            } else if viewModel2 != nil {
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
