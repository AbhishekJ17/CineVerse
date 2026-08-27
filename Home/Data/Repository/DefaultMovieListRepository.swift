//
//  DefaultMovieListRepository.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//

class DefaultMovieListRepository: MovieListRepository {

    func fetchMovieList<T: Decodable>(endPoint: any APIEndPoint) async throws -> T? {
        do {
            return try await APIClient.shared.performRequest(with: endPoint)
        }catch let error as APIError {
            throw error
        }
    }
}
