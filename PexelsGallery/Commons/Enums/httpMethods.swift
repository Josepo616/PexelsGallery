//
//  httpMethods.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/12/25.
//

enum httpMethods: String {

    case get

    var rawValue: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}
