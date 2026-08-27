//
//  MovieListUseCase.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//

protocol MovieListUseCase {
    func fetchMovieListFor(category: MovieCategory, page: Int) async throws -> MovieListResponse?
}

enum MovieCategory: CaseIterable {
    case nowPlaying
    case popular
    case topRated
    case upcoming
}

struct MovieSectionCategory {
    let category: MovieCategory
    let response: Result<MovieListResponse?, APIError>
}
