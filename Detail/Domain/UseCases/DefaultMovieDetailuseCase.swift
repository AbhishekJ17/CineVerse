//
//  DefaultMovieDetailuseCase.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

class DefaultMovieDetailuseCase: MovieDetailUseCase {

    private let movieDetailRepository: MovieDetailRepository

    init(movieDetailRepository: MovieDetailRepository) {
        self.movieDetailRepository = movieDetailRepository
    }

    func execute(movieId: Int) async throws -> Movie? {
        do {
            let result = try await movieDetailRepository.fetchMovieDetail(fromId: movieId)
            return result
        } catch let error as APIError {
            throw error
        }
    }
}
