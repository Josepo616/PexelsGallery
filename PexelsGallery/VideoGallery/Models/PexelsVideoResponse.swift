//
//  PexelsImageResponse.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

struct PexelsVideoResponse: Decodable {
    let page: Int
    let perPage: Int
    let videos: [PexelsVideoModel]
    let totalResults: Int
    let nextPage: String?
}
