//
//  PexelsViewModel.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

@MainActor
class PexelsVideoViewModel: ObservableObject {
    
    @Published var videos: [PexelsVideoModel] = []
    @Published var error: NetworkClientError?
    @Published var loadingState: LoadingState = .initialLoading
    @Published var showAlert = false

    private var currentPage = 1
    private var isLoading = false

    private let client: PexelsClientProtocol

    init(
        client: PexelsClientProtocol = PexelsClient(
            networkClient: NetworkClient(),
            requestBuilder: PexelsRequestBuilder(),
            apiKey: "nHjZysc3wXqp1jwscxPDQZ0hPYK5ufovkTjsKbhxw0ISEAf8sjBJwI2J"
        )
    ) {
        self.client = client
    }

    func fetchVideos(isLoadMore: Bool = false, preserveData: Bool = false) async {

        guard !isLoading else {
            return
        }

        isLoading = true
        defer {
            isLoading = false
        }

        if isLoadMore {
            currentPage += 1
            loadingState = .loadingMore
        } else {
            currentPage = 1
            loadingState = preserveData ? .loadingMore : .initialLoading
        }

        do {
            try await Task.sleep(for: .seconds(2))

            let newVideos = try await client.searchVideos(
                query: "dark",
                perPage: 12,
                page: currentPage
            )

            if isLoadMore {
                videos.append(contentsOf: newVideos)
            } else {
                videos = preserveData ? videos + newVideos : newVideos
            }

            loadingState = videos.isEmpty ? .empty : .loaded
        } catch let error as NetworkClientError {
            showAlert = true
            self.error = error
            loadingState = .error
        } catch {
            showAlert = true
            self.error = .invalidResponse
            loadingState = .error
        }
    }
}
