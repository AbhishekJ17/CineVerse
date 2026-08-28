//
//  MovieDetailView.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

import SwiftUI

struct MovieDetailView: View {

    var movie: Movie
    var body: some View {
        Text(movie.title)
    }
}

#Preview {
    MovieDetailView(movie: dummyMovie)
}
