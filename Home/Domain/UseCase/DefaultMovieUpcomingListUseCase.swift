//
//  DefaultMovieUpcomingListUseCase.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//

class DefaultMovieUpcomingListUseCase: MovieListUseCase {

    private let repository: MovieListRepository

    init(repository: MovieListRepository) {
        self.repository = repository
    }

    func fetchMovieList(page: Int) async throws -> (MovieListResponse?, APIError) {
        let result: Result<MovieListResponse, APIError> = try await repository.fetchMovieList(
            endPoint: MovieEndPoints.upcoming(page: page)
        )
        switch result {
        case .success(let movieList):
            return (movieList, .success)
        case .failure(let failure):
            return (nil, failure)
        }
    }
}
