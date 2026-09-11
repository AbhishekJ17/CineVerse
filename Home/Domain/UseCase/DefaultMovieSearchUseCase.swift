//
//  DefaultMovieSearchUseCase.swift
//  CineVerse
//
//  Created by Admin on 11/09/26.
//

class DefaultMovieSearchUseCase: MovieSearchUseCase {

    private let repository: MovieListRepository

    init(repository: MovieListRepository) {
        self.repository = repository
    }

    func searchMovies(query: String, page: Int) async throws -> MovieListResponse? {
        let searchEndPoint = MovieEndPoints.searchMovie(query: query, page: page)
        do {
            return try await repository.fetchMovieList(endPoint: searchEndPoint)
        } catch let error as APIError {
            throw error
        }
    }
}
