//
//  ContentView.swift
//  CineVerse
//
//  Created by Admin on 30/06/26.
//

import SwiftUI
import SwiftData

struct MovieListView: View {

    var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("CineVerse")
            .onAppear {
                viewModel.fetchMovies(page: 1)
            }
    }
}

#if DEBUG
#Preview {
    let viewModel: MovieListViewModel = DefaultMovieListViewModel()
    MovieListView(viewModel: viewModel)
}
#endif
