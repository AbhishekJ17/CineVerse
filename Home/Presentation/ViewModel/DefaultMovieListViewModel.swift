//
//  MovieListViewModel.swift
//  CineVerse
//
//  Created by Admin on 23/07/26.
//

import Foundation
import Combine

protocol MovieListViewModelInput {
    var searchText: String { get set }
    var isSearchPresented: Bool { get set }
    func fetchAllSections()
    func loadNextPageFor(category: MovieCategory)
}

protocol MovieListViewModelOutput {
    var movieList: [MovieCategory: [Movie]] { get set }
    var errorMessage: [MovieCategory: String] { get set }
    var isLoading: Bool { get set }
}

typealias MovieListViewModel = MovieListViewModelInput & MovieListViewModelOutput

final class DefaultMovieListViewModel: MovieListViewModel, ObservableObject {

    @Published var movieList: [MovieCategory : [Movie]] = [:]
    @Published var isLoading: Bool = false
    @Published var errorMessage: [MovieCategory: String] = [:]
    @Published var isLoadingPage: [MovieCategory : Bool] = [:]
    @Published var searchText: String = "" {
        didSet {
            searchMovies()
        }
    }
    @Published var isSearchPresented: Bool = false

    private(set) var pagination: [MovieCategory : Int] = [:]
    private(set) var hasMorePages: [MovieCategory: Bool] = [:]
    private var paginationTask: Task<Void, Never>?

    private let repository: MovieListRepository = DefaultMovieListRepository()
    let movieListUseCase: MovieListUseCase

    init(movieListUseCase: MovieListUseCase) {
        self.movieListUseCase = movieListUseCase
        fetchAllSections()
    }

    private func resetPages() {
        movieList = [:]
        pagination = [:]
        hasMorePages = [:]
        isLoadingPage = [:]
    }

    private func searchMovies() {
        debugPrint("query: ", searchText)
        debugPrint("Is CineVerse searching: ", isSearchPresented)
    }

    @MainActor
    func fetchAllSections() {
        Task {
            self.isLoading = true
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
                self.resetPages()
                for await sectionResult in group {
                    let category = sectionResult.category

                    switch sectionResult.response {
                    case .success(let response):
                        if let response {
                            self.movieList[category] = response.results
                            self.pagination[category] = response.page + 1
                            self.hasMorePages[category] = response.page < response.total_pages
                        }
                    case .failure(let error):
                        self.errorMessage[category] = error.message
                    }
                    self.isLoadingPage[category] = false
                }
            }
            self.isLoading = false
        }
    }

    @MainActor
    func loadNextPageFor(category: MovieCategory) {
        let isAlreadyLoading = isLoadingPage[category] ?? false
        let canLoadMore = hasMorePages[category] ?? false

        guard !isAlreadyLoading && canLoadMore else { return }

        isLoadingPage[category] = true
        let currentPage = pagination[category] ?? 1

        paginationTask?.cancel()

        paginationTask = Task {
            do {
                let (movieList) = try await movieListUseCase.fetchMovieListFor(category: category, page: currentPage)

                guard !Task.isCancelled else { return }

                if let movieList {
                    self.movieList[category, default: []].append(contentsOf: movieList.results)
                    self.hasMorePages[category] = movieList.page < movieList.total_pages
                    self.pagination[category] = movieList.page + 1
                }
            } catch let error as APIError {
                self.errorMessage[category] = error.message
            } catch {
                self.errorMessage[category] = error.localizedDescription
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
