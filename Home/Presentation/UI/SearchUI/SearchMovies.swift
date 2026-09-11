//
//  SearchMovies.swift
//  CineVerse
//
//  Created by Admin on 11/09/26.
//

import SwiftUI

struct SearchMovies: View {

    @EnvironmentObject var viewModel: DefaultMovieListViewModel
    let searchColumns: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil)
    ]
    let spacing: CGFloat = 10.0

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(
                columns: searchColumns,
                spacing: spacing,
                pinnedViews: []) {
                    ForEach(viewModel.searchMovieList) { movie in
                        SearchMovieCard(path: movie.backdrop_path)
                    }
                }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    SearchMovies()
}
