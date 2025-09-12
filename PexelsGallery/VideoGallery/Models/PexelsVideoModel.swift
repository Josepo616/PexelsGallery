//
//  PexelsImage.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

struct PexelsVideoModel: Decodable, Identifiable {

    let id: Int
    let image: String
    let videoFiles: [VideoFile]

    enum CodingKeys: String, CodingKey {
        case id
        case image
        case videoFiles = "video_files"
    }
}
