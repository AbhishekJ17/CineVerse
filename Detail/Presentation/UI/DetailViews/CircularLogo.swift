//
//  CircularLogo.swift
//  CineVerse
//
//  Created by Admin on 02/09/26.
//

import SwiftUI

struct CircularLogo: View {
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
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
                    .background(Color.textPrimary)
                    .border(Color.textMuted, width: 2)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
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
    CircularLogo(imagePath: "/71BqEFAF4V3qjjMPCpLuyJFB9A.png")
}
