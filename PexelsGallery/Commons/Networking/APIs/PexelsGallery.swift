//
//  PexelsGallery.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import Foundation

struct PexelsGallery: Identifiable, Hashable {
    var id: UUID
    var url: URL
    var endpoint: String
    var query: String
    var page: Int

    init(
        id: UUID,
        baseURL: URL? = URL(string: "https://api.pexels.com/v1/"),
        endpoint: String,
        query: String,
        page: Int
    ) {
        guard let baseURL = baseURL else {
            fatalError("Base URL not provided")
        }

        self.id = id
        let urlString =
            baseURL.appendingPathComponent(endpoint).absoluteString
            + "?query=\(query)" + "&page=\(page)"
        guard let finalUrl = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        self.url = finalUrl
        self.endpoint = endpoint
        self.query = query
        self.page = page
    }
}
