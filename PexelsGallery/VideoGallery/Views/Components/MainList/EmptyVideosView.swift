//
//  EmptyVideosView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import SwiftUI

struct EmptyVideosView: View {
    
    var body: some View {
        Text("No videos found.")
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
