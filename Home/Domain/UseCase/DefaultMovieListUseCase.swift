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

    func fetchMovieListFor(category: MovieCategory, page: Int) async throws -> (MovieListResponse?, APIError) {
        let result: Result<MovieListResponse, APIError> = try await repository.fetchMovieList(endPoint: MovieEndPoints.nowPlaying(page: page))

        switch category {
            case .nowPlaying, .popular, .topRated, .upcoming:
            switch result {
            case .success(let movieList):
                return (movieList, .success)
            case .failure(let failure):
                return (nil, failure)
            }
        }
    }

}
