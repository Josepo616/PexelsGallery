//
//  PexelsImageResponse.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

struct PexelsImageResponse: Decodable {
    let photos: [PexelsImageModel]
}
