//
//  ImageLoader.swift
//  CineVerse
//
//  Created by Admin on 27/08/26.
//

import SwiftUI

final actor ImageLoader {

    static let shared = ImageLoader()
    private var localImageCache = NSCache<NSURL, UIImage>()
    private var inFlightTasks: [URL: Task<UIImage, Error>] = [:]
    private let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/")!

    private init() {
        localImageCache.countLimit = 100
        localImageCache.totalCostLimit = 1024 * 1024 * 100
    }

    func image(path: String) async throws -> UIImage {
        let downloadImageURL = imageURL.appending(path: path)
        if let cacheImage = localImageCache.object(forKey: downloadImageURL as NSURL) {
            return cacheImage
        }

        if let existingTask = inFlightTasks[downloadImageURL] {
            return try await existingTask.value
        }

        let task = Task {
            let (data, response) = try await URLSession.shared.data(from: downloadImageURL)
            guard (response as? HTTPURLResponse)?.statusCode == 200,
                  let downloadedImage = UIImage(data: data) else {
                throw URLError(.badServerResponse)
            }
            return downloadedImage
        }

        inFlightTasks[downloadImageURL] = task
        defer {
            inFlightTasks[downloadImageURL] = nil
        }
        let image = try await task.value
        localImageCache.setObject(image, forKey: downloadImageURL as NSURL)
        return image
    }
}
