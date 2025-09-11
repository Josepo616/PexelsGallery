//
//  SRC.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

struct VideoFile: Decodable {
    let id: Int
    let quality: String
    let fileType: String
    let width: Int?
    let height: Int?
    let fps: Double?
    let size: Int?
    let link: String}
