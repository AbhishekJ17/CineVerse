//
//  HeroHeader.swift
//  CineVerse
//
//  Created by Admin on 01/09/26.
//

import SwiftUI

struct HeroHeader: View {
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
                    .frame(height: 350)
                    .clipped()
                    .edgesIgnoringSafeArea(.top)
                Spacer()
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
    HeroHeader(imagePath: "/oQRgyQCzcyZvE6w5heM9ktVY0LT.jpg")
}
