//
//  PexelsClient+init.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/12/25.
//

extension PexelsClient {

    static let defaultInitializer: PexelsClient = PexelsClient(
        networkClient: NetworkClient(),
        requestBuilder: PexelsRequestBuilder(),
        apiKey: "nHjZysc3wXqp1jwscxPDQZ0hPYK5ufovkTjsKbhxw0ISEAf8sjBJwI2J"
    )
}
