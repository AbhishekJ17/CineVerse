//
//  MovieListViewModel.swift
//  CineVerse
//
//  Created by Admin on 23/07/26.
//

import Foundation

protocol MovieListViewModel {
    func fetchMovies(page: Int)
    func fetchNowPlaying(page: Int)
    func fetchPopular(page: Int)
    func fetchTopRated(page: Int)
    func fetchUpcoming(page: Int)

}

final class DefaultMovieListViewModel: MovieListViewModel {

    private let repository: MovieListRepository = DefaultMovieListRepository()
    lazy var movieNowPlayingUseCase: MovieListUseCase = DefaultMovieNowPlayingListUseCase(repository: repository)
    lazy var moviePopularUseCase: MovieListUseCase = DefaultMoviePopularListUseCase(repository: repository)
    lazy var movieTopRatedUseCase: MovieListUseCase = DefaultMovieTopRatedListUseCase(repository: repository)
    lazy var movieUpcomigUseCase: MovieListUseCase = DefaultMovieUpcomingListUseCase(repository: repository)

    func fetchMovies(page: Int) {
        print("---- fetchMovies ---")
        Task {
            fetchNowPlaying(page: page)
            fetchPopular(page: page)
            fetchTopRated(page: page)
            fetchUpcoming(page: page)
        }
    }

    func fetchNowPlaying(page: Int) {
        print("---- fetchNowPlaying ---")
        Task {
            let (movieList, result) = try await movieNowPlayingUseCase.fetchMovieList(page: page)
            if result == .success {
                print("NowPlaying movie list is ready: ", movieList?.results.count)
            }
        }
    }

    func fetchPopular(page: Int) {
        print("---- fetchPopular ---")
        Task {
            let (movieList, result) = try await moviePopularUseCase.fetchMovieList(page: page)
            if result == .success {
                print("Popular movie list is ready: ", movieList?.results.count)
            }
        }
    }

    func fetchTopRated(page: Int) {
        print("---- fetchTopRated ---")
        Task {
            let (movieList, result) = try await movieTopRatedUseCase.fetchMovieList(page: page)
            if result == .success {
                print("TopRated movie list is ready: ", movieList?.results.count)
            }
        }
    }

    func fetchUpcoming(page: Int) {
        print("---- fetchUpcoming ---")
        Task {
            let (movieList, result) = try await movieUpcomigUseCase.fetchMovieList(page: page)
            if result == .success {
                print("Upcoming movie list is ready: ", movieList?.results.count)
            }
        }
    }
}
