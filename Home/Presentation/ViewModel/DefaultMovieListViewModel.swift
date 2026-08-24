//
//  MovieListViewModel.swift
//  CineVerse
//
//  Created by Admin on 23/07/26.
//

import Foundation

protocol MovieListViewModel {
    func fetchMovies()
}

final class DefaultMovieListViewModel: MovieListViewModel {

    let movieListUseCase: MovieListUseCase

    init(movieListUseCase: MovieListUseCase) {
        self.movieListUseCase = movieListUseCase
    }

    func fetchMovies() {
        Task {
            let (result, error) = try await movieListUseCase.fetchMovieList()
            if error == .success {
                print(result)
            }else {
                print(error.message)
            }
        }
    }
}
