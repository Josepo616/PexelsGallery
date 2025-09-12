//
//  PexelsViewModel.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

final class PexelsImageViewModel: PexelsGenericViewModel<PexelsImageModel> {
    init(client: PexelsClientProtocol = PexelsClient.defaultInitializer) {
        super.init(fetchFunction: { page in
            try await client.searchImages(
                query: "dark ambiance",
                perPage: 30,
                page: page
            )
        })
    }
}
