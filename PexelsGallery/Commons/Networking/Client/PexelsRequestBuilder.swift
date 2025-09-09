//
//  PexelsRequestBuilder.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

class PexelsRequestBuilder: RequestBuilderProtocol {
    func buildRequest(for gallery: PexelsGallery, apiKey: String) -> URLRequest {
        var request = URLRequest(url: gallery.url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        return request
    }
}
