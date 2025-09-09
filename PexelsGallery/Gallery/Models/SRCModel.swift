//
//  SRC.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//


struct SRCModel: Decodable {
    let original: String
    let small: String
    let medium: String
    let large: String
    let large2x: String
    let portrait: String
    let landscape: String
    let tiny: String
    
    enum SRCCodingKeys: String, CodingKey {
        case original = "original"
        case small = "small"
        case medium = "medium"
        case large = "large"
        case large2x = "large2x"
        case portrait = "portrait"
        case landscape = "landscape"
        case tiny = "tiny"
    }
}
