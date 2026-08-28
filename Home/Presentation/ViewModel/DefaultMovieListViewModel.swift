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
    var movieList: [MovieCategory: [Movie]] { get set }
    var errorMessage: String { get set }
}

typealias MovieListViewModel = MovieListViewModelInput & MovieListViewModelOutput

final class DefaultMovieListViewModel: MovieListViewModel, ObservableObject {

    @Published var movieList: [MovieCategory : [Movie]] = [:]

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
                        self.movieList[movieList.category] = response?.results
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
                self.movieList[category] = movieList?.results
                return MovieSectionCategory(category: category, response: .success(movieList))
            } catch let error as APIError {
                return MovieSectionCategory(category: category, response: .failure(error))
            } catch {
                return MovieSectionCategory(category: category, response: .failure(.unknown))
            }
        }
    }

    func getMovieListFrom(category: MovieCategory) -> [Movie] {
        guard let movies = self.movieList[category] else {
            return []
        }
        return movies
    }
}
