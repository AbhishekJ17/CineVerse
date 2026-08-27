//
//  ImageLoader.swift
//  CineVerse
//
//  Created by Admin on 27/08/26.
//

import SwiftUI

/*
 SwiftUI View
      │
      ↓
ImageLoader
      │
┌──────────┴──────────┐
↓                     ↓
Memory Cache          In-flight Tasks
│                     │
└──────────┬──────────┘
      ↓
 URLSession
      │
      ↓
 CDN / Server

---------------------------------------------
 When image X is requested:

 Request 1
    ↓
 cache miss
    ↓
 create Task
    ↓
 inFlight[X] = task
 ---------------------------------------------

 Request 2 comes in:

 Request 2
    ↓
 cache miss
    ↓
 X exists in inFlight
    ↓
 await existing Task
 ---------------------------------------------

 Now you get:

 20 UI requests
        ↓
    1 network request
        ↓
    20 consumers

 ImageLoader
    │
    ├── URL construction/configuration
    │
    ├── Memory cache
    │
    ├── In-flight request deduplication
    │
    ├── Network request
    │
    ├── Image decoding/downsampling
    │
    └── Cancellation
 */

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

/*
 Request image
      │
      ▼
 Memory cache?
   │       │
  YES      NO
   │        │
   ▼        ▼
 Return   In-flight task?
            │       │
           YES      NO
            │        │
            ▼        ▼
        await      Create Task
        existing      │
                      ▼
                   Network
                      │
                      ▼
                   UIImage
                      │
               ┌──────┴──────┐
               ▼             ▼
             Cache       All callers
                         get same image
 */
