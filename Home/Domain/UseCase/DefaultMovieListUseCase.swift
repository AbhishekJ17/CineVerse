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
            return try await repository
                .fetchMovieList(endPoint: MovieEndPoints.nowPlaying(page: page))
        } catch let error as APIError {
            throw error
        }
    }

}
