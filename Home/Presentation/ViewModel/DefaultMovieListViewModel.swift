//
//  MovieListViewModel.swift
//  CineVerse
//
//  Created by Admin on 23/07/26.
//

import Foundation
import Combine

protocol MovieListViewModelInput {
    func fetchAllSections()
    func fetchMoviesFor(category: MovieCategory, withPage: Int)
}

protocol MovieListViewModelOutput {
    var nowPlayingMovieList: [Movie] { get set }
    var popularMovieList: [Movie] { get set }
    var topRatedMovieList: [Movie] { get set }
    var upcomingMovieList: [Movie] { get set }
    var errorMessage: String { get set }
}

typealias MovieListViewModel = MovieListViewModelInput & MovieListViewModelOutput

final class DefaultMovieListViewModel: MovieListViewModel, ObservableObject {

    @Published var nowPlayingMovieList: [Movie] = []
    @Published var popularMovieList: [Movie] = []
    @Published var topRatedMovieList: [Movie] = []
    @Published var upcomingMovieList: [Movie] = []
    var errorMessage: String = ""

    private let repository: MovieListRepository = DefaultMovieListRepository()
    let movieListUseCase: MovieListUseCase

    init(movieListUseCase: MovieListUseCase) {
        self.movieListUseCase = movieListUseCase
    }

    func fetchAllSections() {
        Task {
           await withTaskGroup(of: MovieSectionCategory.self) { group in

                for category in MovieCategory.allCases {
                    group.addTask { [movieListUseCase] in
                        do {
                            let movieList = try await movieListUseCase.fetchMovieListFor(category: category, page: 1)
                            return MovieSectionCategory(category: category, response: .success(movieList))
                        } catch let error as APIError {
                            return MovieSectionCategory(category: category, response: .failure(error))
                        } catch {
                            return MovieSectionCategory(category: category, response: .failure(.unknown))
                        }
                    }
                }

                for await movieList in group {
                    switch movieList.response {
                    case .success(let response):
                        self.seperateOutMovieListAccordingTo(category: movieList.category, response: response)
                    case .failure(let error):
                        print("\(movieList.category) -- \(error)")
                    }
                }
            }
        }
    }

    func fetchMoviesFor(category: MovieCategory, withPage: Int) {
        Task {
            do {
                let (movieList) = try await movieListUseCase.fetchMovieListFor(category: category, page: withPage)
                self.seperateOutMovieListAccordingTo(category: category, response: movieList)
                return MovieSectionCategory(category: category, response: .success(movieList))
            } catch let error as APIError {
                return MovieSectionCategory(category: category, response: .failure(error))
            } catch {
                return MovieSectionCategory(category: category, response: .failure(.unknown))
            }
        }
    }

    private func seperateOutMovieListAccordingTo(category: MovieCategory, response: MovieListResponse?) {
        switch category {
        case .nowPlaying:
            self.nowPlayingMovieList = response?.results ?? []
        case .popular:
            self.popularMovieList = response?.results ?? []
        case .upcoming:
            self.upcomingMovieList = response?.results ?? []
        case .topRated:
            self.topRatedMovieList = response?.results ?? []
        }
    }
}
