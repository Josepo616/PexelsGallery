//
//  PexelsViewModel.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

final class PexelsVideoViewModel: PexelsGenericViewModel<PexelsVideoModel> {
    init(client: PexelsClientProtocol = PexelsClient.defaultInitializer) {
        super.init(fetchFunction: { page in
            try await client.searchVideos(
                query: "dark",
                perPage: 12,
                page: page
            )
        })
    }
}
