//
//  PexelsImage.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import Foundation

struct PexelsImageModel: Decodable, Identifiable {
    let id: Int
    let width: Double
    let height: Double
    let url: String
    let photographer: String
    let photographerUrl: String
    let photographerId: Int
    let avg_color: String
    let src: SRCModel
    let liked: Bool
    let alt: String

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, photographer, src, liked, alt
        case photographerUrl = "photographer_url"
        case photographerId = "photographer_id"
        case avg_color
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        id = try c.decode(Int.self, forKey: .id)
        width = try c.decode(Double.self, forKey: .width)
        height = try c.decode(Double.self, forKey: .height)
        url = try c.decode(String.self, forKey: .url)
        photographer = try c.decode(String.self, forKey: .photographer)
        photographerUrl = try c.decodeOrDefault(String.self, forKey: .photographerUrl, defaultValue: "null")
        photographerId = try c.decodeOrDefault(Int.self, forKey: .photographerId, defaultValue: 0)
        avg_color = try c.decodeOrDefault(String.self, forKey: .avg_color, defaultValue: "#000000")
        src = try c.decode(SRCModel.self, forKey: .src)
        liked = try c.decode(Bool.self, forKey: .liked)
        alt = try c.decode(String.self, forKey: .alt)
    }
}
