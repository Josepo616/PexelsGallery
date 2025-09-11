//
//  NetworkClient+Paginated.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/11/25.
//

import Foundation

extension NetworkClient {
    func sendPaginatedVideosRequest(_ request: URLRequest) async throws -> [PexelsVideoModel] {
        let response: PexelsVideoResponse = try await sendRequest(request)
        return response.videos
    }
}
