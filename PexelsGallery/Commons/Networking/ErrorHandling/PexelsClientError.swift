//
//  PexelsClientError.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

enum PexelsClientError: Error {
    case invalidResponse, decodingError, networkError(Error)
}
