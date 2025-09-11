//
//  PexelsClient.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/8/25.
//

import Foundation

class PexelsClient: PexelsClientProtocol {

    private let networkClient: NetworkClientProtocol
    private let requestBuilder: RequestBuilderProtocol
    private let apiKey: String

    init(
        networkClient: NetworkClientProtocol,
        requestBuilder: RequestBuilderProtocol,
        apiKey: String
    ) {
        self.networkClient = networkClient
        self.requestBuilder = requestBuilder
        self.apiKey = apiKey
    }

    func searchImages(query: String, perPage: Int, page: Int) async throws
        -> [PexelsImageModel]
    {
        let isConnected = await checkInternetConnection()

        guard isConnected else {
            throw NetworkClientError.noConnection
        }

        let gallery = PexelsGalleryAPI(
            id: UUID(),
            endpoint: PexelsEndpoint.photoSearch,
            query: query,
            perPage: perPage,
            page: page
        )
        return try await fetchImagesModels(from: gallery)
    }

    func fetchImagesModels(from gallery: PexelsGalleryAPI) async throws
        -> [PexelsImageModel]
    {
        let request = requestBuilder.buildRequest(for: gallery, apiKey: apiKey)
        let response: PexelsImageResponse = try await networkClient.sendRequest(
            request
        )
        return response.photos
    }
}
