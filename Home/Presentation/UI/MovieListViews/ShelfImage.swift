//
//  ShelfImage.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct ShelfImage: View {
    var imagePath: String
    @State private var phase: ImagePhase = .empty

    enum ImagePhase {
        case empty
        case success(UIImage)
        case failure
    }

    init(imagePath: String) {
        self.imagePath = imagePath
    }
    
    var body: some View {
        Group {
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 150, height: 180)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            case .failure:
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(.secondary)
            }
        }
        .task {
            await loadImage()
        }
    }
    private func loadImage() async {
        do {
            let image = try await ImageLoader.shared.image(path: imagePath)
            phase = .success(image)
        } catch {
            phase = .failure
        }
    }
}

#Preview {
    ShelfImage(imagePath: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg")
}
