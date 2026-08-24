//
//  ContentView.swift
//  CineVerse
//
//  Created by Admin on 30/06/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("CineVerse")
            .onAppear {
                viewModel.fetchMovies()
            }
    }

}

#if DEBUG
#Preview {
    ContentView(viewModel: DefaultMovieListViewModel())
}
#endif
