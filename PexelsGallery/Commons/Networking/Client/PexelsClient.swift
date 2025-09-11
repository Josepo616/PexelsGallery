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
    
    func searchVideos(query: String, perPage: Int, page: Int) async throws -> [PexelsVideoModel] {
        let isConnected = await checkInternetConnection()
        
        print("[DEBUG] Checking internet connection: \(isConnected)")

        guard isConnected else {
            print("[DEBUG] No internet connection detected.")
            throw NetworkClientError.noConnection
        }

        let gallery = PexelsGalleryAPI(
            id: UUID(),
            endpoint: PexelsEndpoint.videoSearch,
            query: query,
            perPage: perPage,
            page: page
        )

        print("[DEBUG] Created gallery for videos: \(gallery)")

        do {
            let videos = try await fetchVideosModels(from: gallery)
            print("[DEBUG] Successfully fetched \(videos.count) videos")
            return videos
        } catch {
            print("[DEBUG] Error fetching videos: \(error)")
            throw error
        }
    }

    func fetchVideosModels(from gallery: PexelsGalleryAPI) async throws -> [PexelsVideoModel] {
        let request = requestBuilder.buildRequest(for: gallery, apiKey: apiKey)
        
        if let url = request.url {
            print("[DEBUG] Built request URL: \(url.absoluteString)")
        } else {
            print("[DEBUG] Failed to build request URL")
        }

        do {
            let response: PexelsVideoResponse = try await networkClient.sendRequest(request)
            print("[DEBUG] Received response with \(response.videos.count) videos")
            return response.videos
        } catch {
            print("[DEBUG] Network request failed with error: \(error)")
            throw error
        }
    }
}
