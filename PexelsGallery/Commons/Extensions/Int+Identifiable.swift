//
//  Int+Identifiable.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

extension Int: @retroactive Identifiable {

    public var id: Int { self }
}
