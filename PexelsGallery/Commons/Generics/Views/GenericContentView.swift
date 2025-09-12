//
//  GenericContentView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/12/25.
//

import SwiftUI

struct GenericContentView<Item: Identifiable, Content: View, Empty: View>: View {
    
    @ObservedObject var viewModel: PexelsGenericViewModel<Item>
    @Binding var selectedID: Item.ID?
    let grid: () -> Content
    let empty: () -> Empty
    let loadingMessage: String
    let retryMessage: String

    var body: some View {
        switch viewModel.loadingState {
        case .initialLoading:
            LoadingStateView(message: loadingMessage)

        case .loadingMore, .loaded, .error:
            if viewModel.items.isEmpty {
                if viewModel.loadingState == .error {
                    RefreshStateView(viewModel: viewModel, retryMessage: retryMessage)
                } else {
                    empty()
                }
            } else {
                grid()
            }

        case .empty:
            empty()
        }
    }
}
