//
//  NetworkClientProtocol.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

protocol NetworkClientProtocol {
    
    func sendRequest<T: Decodable>(
        _ request: URLRequest,
    ) async throws -> T
}
