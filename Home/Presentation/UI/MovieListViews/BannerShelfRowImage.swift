//
//  BannerShelfRowImage.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct BannerShelfRowImage: View {
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
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 250)
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
    BannerShelfRowImage(imagePath: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg")
}
