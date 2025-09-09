//
//  Decode+Default.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

extension KeyedDecodingContainer where K: CodingKey {
    func decodeOrDefault<T>(_ type: T.Type, forKey key: K, defaultValue: T) throws -> T where T: Decodable {
        try decodeIfPresent(type, forKey: key) ?? defaultValue
    }
}
