//
//  CineVerseRemoteImage.swift
//  CineVerse
//
//  Created by Admin on 05/09/26.
//

import SwiftUI

struct CineVerseRemoteImage: View {

    let path: String
    @State private var phase: ImagePhase = .empty

    enum ImagePhase {
        case empty
        case success(UIImage)
        case failure
    }

    var body: some View {
        Group {
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                Image(uiImage: image)
                    .resizable()                    
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
            let image = try await ImageLoader.shared.image(path: path)
            phase = .success(image)
        } catch {
            phase = .failure
        }
    }
}

#Preview {
    CineVerseRemoteImage(path: "/bjiS5ipwxb9JFy3XRRN4OAilSeX.jpg")
}
