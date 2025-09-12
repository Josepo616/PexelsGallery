//
//  GenericEmptyStateView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/12/25.
//

import SwiftUI

struct GenericEmptyStateView: View {
    let message: String
    var systemImage: String? = nil

    var body: some View {
        VStack(spacing: 12) {
            if let systemImage = systemImage {
                Image(systemName: systemImage)
                    .font(.system(size: 40))
                    .foregroundColor(.gray.opacity(0.7))
            }
            
            Text(message)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
