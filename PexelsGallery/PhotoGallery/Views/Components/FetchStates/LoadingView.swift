//
//  LoadingView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/10/25.
//

import SwiftUI

struct LoadingView: View {

    var viewModel: PexelsViewModel
    var body: some View {
        VStack {
            Text("Loading images...")
                .foregroundColor(.gray)
            ProgressView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
