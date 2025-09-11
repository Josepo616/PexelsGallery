//
//  PexelsGallery.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import Foundation

struct PexelsGalleryAPI: Identifiable {
    
    let id: UUID
    let endpoint: PexelsEndpoint
    let query: String
    let perPage: Int
    let page: Int

    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.pexels.com"
        components.path = endpoint.path
        components.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "page", value: "\(page)"),

        ]

        guard let finalURL = components.url else {
            fatalError("Invalid URL components: \(components)")
        }
        print(finalURL)
        return finalURL
    }

    init(
        id: UUID = UUID(),
        endpoint: PexelsEndpoint,
        query: String,
        perPage: Int,
        page: Int
    ) {
        self.id = id
        self.endpoint = endpoint
        self.query = query
        self.perPage = perPage
        self.page = page
    }
}
