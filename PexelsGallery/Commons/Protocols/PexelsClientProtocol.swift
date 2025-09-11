//
//  PexelsClientProtocol.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation

protocol PexelsClientProtocol {
    func searchImages(query: String, perPage: Int, page: Int) async throws -> [PexelsImageModel]
    func fetchImagesModels(from galleryImage: PexelsGalleryAPI) async throws -> [PexelsImageModel]
}
