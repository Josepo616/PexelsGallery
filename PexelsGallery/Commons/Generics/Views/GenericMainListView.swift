//
//  GenericMainListView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/12/25.
//

import SwiftUI

struct GenericMainListView<
    Item: Identifiable,
    ContentView: View,
    DestinationView: View
>: View {

    @ObservedObject var viewModel: PexelsGenericViewModel<Item>
    @State private var selectedID: Item.ID? = nil

    let contentView:
        (
            _ viewModel: PexelsGenericViewModel<Item>,
            _ selectedID: Binding<Item.ID?>
        ) -> ContentView
    let destinationView: (_ id: Item.ID, _ items: [Item]) -> DestinationView

    var body: some View {
        NavigationStack {
            contentView(viewModel, $selectedID)
                .navigationTitle("Pexels Gallery")
                .navigationDestination(item: $selectedID) { id in
                    destinationView(id, viewModel.items)
                }
        }
        .alert("Error", isPresented: $viewModel.showAlert) {
            Button("OK") {
                viewModel.error = nil
                viewModel.showAlert = false
            }
            Button("Exit", role: .cancel) {
                exit(0)
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "Unknown error")
        }
    }
}
