//
//  PexelsImage.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import Foundation

struct PexelsImageModel: Decodable, Identifiable {
    let id: Int
    let photographer: String
    let src: SRCModel
    let alt: String
}
