//
//  PexelsImage.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

struct PexelsVideoModel: Decodable, Identifiable {
    let id: Int
    let width: Int
    let height: Int
    let url: String
    let image: String
    let duration: Int
    let user: User
    let videoFiles: [VideoFile]
    let videoPictures: [VideoPicture]
}
