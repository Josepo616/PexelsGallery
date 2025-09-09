//
//  PexelsGallery.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import Foundation

struct PexelsGallery: Identifiable, Hashable {
    let id: UUID
    let endpoint: PexelsEndpoint
    let query: String
    let page: Int

    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.pexels.com"
        components.path = endpoint.path
        components.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "\(page)")
        ]

        guard let finalURL = components.url else {
            fatalError("Invalid URL components: \(components)")
        }
        return finalURL
    }

    init(id: UUID = UUID(), endpoint: PexelsEndpoint, query: String, page: Int) {
        self.id = id
        self.endpoint = endpoint
        self.query = query
        self.page = page
    }
}

