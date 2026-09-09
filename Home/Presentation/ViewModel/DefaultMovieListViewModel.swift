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
    func loadNextPageFor(category: MovieCategory)
}

protocol MovieListViewModelOutput {
    var movieList: [MovieCategory: [Movie]] { get set }
    var errorMessage: String { get set }
    var isLoading: Bool { get set }
}

typealias MovieListViewModel = MovieListViewModelInput & MovieListViewModelOutput

final class DefaultMovieListViewModel: MovieListViewModel, ObservableObject {

    @Published var movieList: [MovieCategory : [Movie]] = [:]
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var isLoadingPage: [MovieCategory : Bool] = [:]

    private(set) var pagination: [MovieCategory : Int32] = [:]
    private(set) var hasMorePages: [MovieCategory: Bool] = [:]
    private var paginationTask: Task<Void, Never>?

    private let repository: MovieListRepository = DefaultMovieListRepository()
    let movieListUseCase: MovieListUseCase

    init(movieListUseCase: MovieListUseCase) {
        self.movieListUseCase = movieListUseCase
        fetchAllSections()
    }

    func fetchAllSections() {
        Task {
           await withTaskGroup(of: MovieSectionCategory.self) { group in
               self.isLoading = true
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
                        self.pagination[movieList.category] = (response?.page ?? 0) + 1
                        self.hasMorePages[movieList.category] = response?.page ?? 0 < response?.total_pages ?? 0
                        self.isLoadingPage[movieList.category] = false
                        self.isLoading = false
                    case .failure(let error):
                        print("\(movieList.category) -- \(error)")
                        self.errorMessage = error.message
                    }
                }
            }
        }
    }

    func loadNextPageFor(category: MovieCategory) {
        guard !(isLoadingPage[category] ?? false) && hasMorePages[category] ?? false else {
            return
        }

        isLoadingPage[category] = true
        let currentPage = Int(pagination[category] ?? 0)

        paginationTask?.cancel()

        paginationTask = Task {
            do {
                let (movieList) = try await movieListUseCase.fetchMovieListFor(category: category, page: currentPage)

                guard !Task.isCancelled else { return }

                self.movieList[category]?.append(contentsOf: movieList?.results ?? [])
                self.hasMorePages[category] = movieList?.page ?? 0 < movieList?.total_pages ?? 0
                self.pagination[category]! += 1
            } catch let error as APIError {
                self.errorMessage = error.message
            } catch {
                self.errorMessage = error.localizedDescription
            }

            isLoadingPage[category] = false
        }
    }

    func getMovieListFrom(category: MovieCategory) -> [Movie] {
        guard let movies = self.movieList[category] else {
            return []
        }
        return movies
    }
}
