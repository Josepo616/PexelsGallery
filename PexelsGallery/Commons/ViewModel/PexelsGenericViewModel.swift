//
//  PexelsGenericViewModel.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/12/25.
//

import Foundation

@MainActor
class PexelsGenericViewModel<T>: ObservableObject {

    @Published var items: [T] = []
    @Published var error: NetworkClientError?
    @Published var loadingState: LoadingState = .initialLoading
    @Published var showAlert = false

    private var currentPage = 1
    private var isLoading = false
    private let fetchFunction: (_ page: Int) async throws -> [T]

    init(fetchFunction: @escaping (_ page: Int) async throws -> [T]) {
        self.fetchFunction = fetchFunction
    }

    func fetchItems(isLoadMore: Bool = false, preserveData: Bool = false) async
    {
        guard !isLoading else { return }

        isLoading = true
        defer { isLoading = false }

        if isLoadMore {
            currentPage += 1
            loadingState = .loadingMore
        } else {
            currentPage = 1
            loadingState = preserveData ? .loadingMore : .initialLoading
        }

        do {
            try await Task.sleep(for: .seconds(2))  // Simula delay

            let newItems = try await fetchFunction(currentPage)

            if isLoadMore {
                items.append(contentsOf: newItems)
            } else {
                items = preserveData ? items + newItems : newItems
            }

            loadingState = items.isEmpty ? .empty : .loaded

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
