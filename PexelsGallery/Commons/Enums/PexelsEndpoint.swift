//
//  endpoint.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

enum PexelsEndpoint {
    case photoSearch
    case videoSearch

    var path: String {
        switch self {
        case .photoSearch:
            return "/v1/search"
        case .videoSearch:
            return "/v1/videos/search"
        }
    }
}
