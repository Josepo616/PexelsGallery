//
//  GenericDestinationView.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/12/25.
//

import SwiftUI

struct GenericDestinationView<Item: Identifiable, Detail: View>: View {
    let id: Item.ID
    let items: [Item]
    let itemType: String
    let detail: (Item) -> Detail

    var body: some View {
        if let item = items.first(where: { $0.id == id }) {
            detail(item)
        } else {
            Text("\(itemType) with id \(id) not found")
        }
    }
}
