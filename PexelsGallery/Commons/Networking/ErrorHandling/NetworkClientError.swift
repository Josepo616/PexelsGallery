//
//  NetworkError.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

enum NetworkClientError: Error {

    case badUrl, badConnection, noConnection, timeout, connectionFailed,
        hostNotFound, sslError, connectionLost, invalidResponse, unknown

    var localizedDescription: String {
        switch self {
        case .badUrl:
            return "The URL is invalid."
        case .noConnection:
            return
                "Unable to connect to the server, check your internet connection."
        case .badConnection:
            return "Unable to connect to the server"
        case .timeout:
            return "The request timed out."
        case .connectionFailed:
            return "The connection failed, check your internet connection."
        case .hostNotFound:
            return "The server could not be found."
        case .sslError:
            return "A secure connection could not be established."
        case .connectionLost:
            return "The network connection was lost."
        case .invalidResponse:
            return "The server did not return a valid response."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
