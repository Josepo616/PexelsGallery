//
//  GenericGridScrollView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/12/25.
//

import SwiftUI

struct GenericGridScrollView<Item: Identifiable, Content: View>: View {
    
    @ObservedObject var viewModel: PexelsGenericViewModel<Item>
    @Binding var selectedID: Item.ID?
    let message: String
    let retryMessage: String
    let content: (_ item: Item) -> Content

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
                ForEach(viewModel.items.indices, id: \.self) { index in
                    let item = viewModel.items[index]
                    content(item)
                        .onTapGesture {
                            selectedID = item.id
                        }
                        .onAppear {
                            if index == viewModel.items.count - 1 {
                                Task { await viewModel.fetchItems(isLoadMore: true) }
                            }
                        }
                }
            }

            switch viewModel.loadingState {
            case .loadingMore:
                LoadingStateView(message: message)
            case .error:
                RefreshStateView(viewModel: viewModel, retryMessage: retryMessage).padding()
            default:
                EmptyView()
            }
        }
        .onAppear {
            if viewModel.items.isEmpty && viewModel.loadingState == .initialLoading {
                Task { await viewModel.fetchItems() }
            }
        }
    }
}
