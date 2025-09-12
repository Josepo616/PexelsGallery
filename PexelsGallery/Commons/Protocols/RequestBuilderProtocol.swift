//
//  RequestBuilderProtocol.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

protocol RequestBuilderProtocol {
    
    func buildRequest(for gallery: PexelsGalleryAPI, apiKey: String) -> URLRequest
}
