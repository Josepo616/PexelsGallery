//
//  PexelsViewModel.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

@MainActor
class PexelsViewModel: ObservableObject {
    @Published var images: [PexelsImageModel] = []
    @Published var error: Error?
    
    private var currentPage = 1
    private var isLoading = false
    
    private let client: PexelsClientProtocol
    
    init(client: PexelsClientProtocol = PexelsClient(networkClient: NetworkClient(), apiKey: "nHjZysc3wXqp1jwscxPDQZ0hPYK5ufovkTjsKbhxw0ISEAf8sjBJwI2J")) {
        self.client = client
    }

    func fetchImages(isLoadMore: Bool = false) async {
        guard !isLoading else { return }
        isLoading = true
        defer { isLoading = false }
        
        if isLoadMore {
            currentPage += 1
        } else {
            currentPage = 1
        }
        
        do {
            let newImages = try await client.searchImages(query: "dark ambiance", page: currentPage)
            
            if isLoadMore {
                self.images.append(contentsOf: newImages)
            } else {
                self.images = newImages
            }
        } catch {
            self.error = error
        }
    }
}


