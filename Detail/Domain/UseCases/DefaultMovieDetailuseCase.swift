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

    func execute(movieId: Int32) async throws -> MovieDetail? {
        do {
            return try await movieDetailRepository.fetchMovieDetail(fromId: movieId)
        } catch let error as APIError {
            throw error
        }
    }
}
