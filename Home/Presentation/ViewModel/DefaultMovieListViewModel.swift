//
//  MovieListViewModel.swift
//  CineVerse
//
//  Created by Admin on 23/07/26.
//

import Foundation
import Combine

protocol MovieListViewModel {
    func fetchAllSections()
    func fetchMoviesFor(category: MovieCategory, withPage: Int)
}

final class DefaultMovieListViewModel: MovieListViewModel, ObservableObject {

    private let repository: MovieListRepository = DefaultMovieListRepository()
    lazy var movieListUseCase: MovieListUseCase = DefaultMovieListUseCase(repository: repository)

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
                        print("\(movieList.category) -- \(response!.results.count)")
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
                return MovieSectionCategory(category: category, response: .success(movieList))
            } catch let error as APIError {
                return MovieSectionCategory(category: category, response: .failure(error))
            } catch {
                return MovieSectionCategory(category: category, response: .failure(.unknown))
            }
        }
    }
}
