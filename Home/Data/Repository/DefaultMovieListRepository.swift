//
//  DefaultMovieListRepository.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//

class DefaultMovieListRepository: MovieListRepository {

    func fetchMovieList<T: Decodable>(endPoint: any APIEndPoint) async throws -> Result<T, APIError> {
        let result: Result<T, APIError> = try await APIClient.shared.performRequest(with: endPoint)
        switch result {
        case .success(let movieList):
            return .success(movieList)
        case .failure(let failure):
            return .failure(failure)
        }
    }
}
