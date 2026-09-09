//
//  DefaultMovieListUseCase.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//

class DefaultMovieListUseCase: MovieListUseCase {

    private let repository: MovieListRepository

    init(repository: MovieListRepository) {
        self.repository = repository
    }

    func fetchMovieListFor(category: MovieCategory, page: Int) async throws -> MovieListResponse? {
        do {
            let endPoint: MovieEndPoints
            switch category {
            case .nowPlaying: endPoint = .nowPlaying(page: page)
            case .popular: endPoint = .popular(page: page)
            case .topRated: endPoint = .topRated(page: page)
            case .upcoming: endPoint = .upcoming(page: page)
            }
            return try await repository.fetchMovieList(endPoint: endPoint)
        } catch let error as APIError {
            throw error
        }
    }

}
