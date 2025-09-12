//
//  RefreshView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/10/25.
//

import SwiftUI

struct RefreshStateView<Item: Identifiable>: View {
    @ObservedObject var viewModel: PexelsGenericViewModel<Item>
    let retryMessage: String

    var body: some View {
        VStack(spacing: 16) {
            Text("Failed to load content.")
                .foregroundColor(.red)

            Button(retryMessage) {
                Task {
                    await viewModel.fetchItems(
                        preserveData: !viewModel.items.isEmpty
                    )
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

