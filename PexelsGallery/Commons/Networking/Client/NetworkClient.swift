//
//  NetworkClient.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

class NetworkClient: NetworkClientProtocol {
    
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func sendRequest<T: Decodable>(_ request: URLRequest) async throws -> T {
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                throw NetworkClientError.invalidResponse
            }

            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)

        } catch let error as URLError {
            switch error.code {
            case .badURL:
                throw NetworkClientError.badUrl
            case .timedOut:
                throw NetworkClientError.timeout
            case .notConnectedToInternet:
                throw NetworkClientError.noConnection
            case .cannotFindHost:
                throw NetworkClientError.hostNotFound
            case .cannotConnectToHost:
                throw NetworkClientError.connectionFailed
            case .secureConnectionFailed:
                throw NetworkClientError.sslError
            case .networkConnectionLost:
                throw NetworkClientError.connectionLost
            default:
                throw NetworkClientError.badConnection
            }
        } catch let decodingError {
            throw NetworkClientError.unknown
        }
    }
}
