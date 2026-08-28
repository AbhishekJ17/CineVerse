//
//  ShelfRow.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct ShelfRow: View {
    var movie: Movie
    let onSelect: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ShelfImage(imagePath: movie.backdrop_path)
            ShelfMetadataView(title: movie.title, rating: movie.vote_average)
        }
        .onTapGesture {
            onSelect()
        }
    }
}

#Preview {
    ShelfRow(movie: dummyMovie, onSelect: {})
}
