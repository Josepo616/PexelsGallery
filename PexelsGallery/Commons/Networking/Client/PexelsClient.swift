//
//  PexelsClient.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import Foundation

class PexelsClient: PexelsClientProtocol{
    private let networkClient: NetworkClientProtocol
    private let apiKey: String
    
    init(networkClient: NetworkClientProtocol, apiKey: String) {
        self.networkClient = networkClient
        self.apiKey = apiKey
    }
    
    func searchImages(query: String, page: Int) async throws -> [PexelsImageModel] {
        let gallery = PexelsGallery(id: UUID(), endpoint: endpoint.search.rawValue, query: query, page: page)
        let images = try await fetchImagesModels(from: gallery)
        return images
    }

    
    func fetchImagesModels(from gallery: PexelsGallery) async throws -> [PexelsImageModel] {
        var request = URLRequest(url: gallery.url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        if let headers = request.allHTTPHeaderFields {
            for (key, value) in headers {
                print("  \(key): \(value)")
            }
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(PexelsImageResponse.self, from: data)
            return response.photos
        } catch {
            throw error
        }
    }

}

struct PexelsImageResponse: Decodable {
    let photos: [PexelsImageModel]
}
