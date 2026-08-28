//
//  DefaultMovieDetailRepository.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

class DefaultMovieDetailRepository: MovieDetailRepository {

    func fetchMovieDetail(fromId: Int) async throws -> Movie? {
        let movieDetailEndPoint = MovieDetailEndPoint.detail(fromId)
        do {
            return try await APIClient.shared.performRequest(with: movieDetailEndPoint)
        } catch let error as APIError {
            throw error
        }
    }
}
