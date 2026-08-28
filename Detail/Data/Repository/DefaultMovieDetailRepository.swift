//
//  DefaultMovieDetailRepository.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

class DefaultMovieDetailRepository: MovieDetailRepository {

    func fetchMovieDetail<T: Decodable>(fromId: Int32) async throws -> T? {
        let movieDetailEndPoint = MovieDetailEndPoint.detail(fromId)
        do {
            return try await APIClient.shared.performRequest(with: movieDetailEndPoint)
        } catch let error as APIError {
            throw error
        }
    }
}
