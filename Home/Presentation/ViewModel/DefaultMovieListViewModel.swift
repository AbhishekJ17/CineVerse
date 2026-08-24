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

    func fetchMovies() {
        Task {
            let result: Result<MovieListResponse, APIError> = try await APIClient.shared.performRequest(
                with: MovieEndPoints.nowPlaying(page: 1)
            )
            switch result {
            case .success(let movieList):
                debugPrint(movieList)
            case .failure(let failure):
                debugPrint("Error is ", failure.message)
            }
        }
    }
}
