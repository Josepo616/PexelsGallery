//
//  Int+Identifiable.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/9/25.
//

import Foundation


extension Int: @retroactive Identifiable {
    public var id: Int { self }
}
