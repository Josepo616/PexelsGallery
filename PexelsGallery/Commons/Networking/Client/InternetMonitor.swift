//
//  InternetMonitor.swift
//  PexelsGallery
//
//  Created by JoseAlvarez on 9/10/25.
//

import Network

func checkInternetConnection() async -> Bool {
    await withCheckedContinuation { continuation in
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "CheckInternetConnectionQueue")
        
        monitor.pathUpdateHandler = { path in
            continuation.resume(returning: path.status == .satisfied)
            monitor.cancel()
        }
        monitor.start(queue: queue)
    }
}
