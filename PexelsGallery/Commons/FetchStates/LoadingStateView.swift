//
//  LoadingView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/10/25.
//

import SwiftUI

struct LoadingStateView: View {
    let message: String

    var body: some View {
        VStack(spacing: 12) {
            Text(message)
                .foregroundColor(.gray)
            ProgressView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
