//
//  LabelWithValue.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import SwiftUI

struct LabelWithValue: View {

    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
