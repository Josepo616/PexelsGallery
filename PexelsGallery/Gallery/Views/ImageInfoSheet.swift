//
//  ImageInfoSheet.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import SwiftUI

struct ImageInfoSheet: View {

    let image: PexelsImageModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Image Info")
                    .font(.title2)
                    .bold()

                VStack(alignment: .leading, spacing: 12) {
                    LabelWithValue(
                        label: "ID",
                        value: "\(image.id)"
                    )
                    LabelWithValue(
                        label: "Photographer",
                        value: image.photographer
                    )
                    LabelWithValue(
                        label: "Description",
                        value: !image.alt.isEmpty
                            ? image.alt : "No description available"
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
