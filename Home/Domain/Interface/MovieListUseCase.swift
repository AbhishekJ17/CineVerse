//
//  MovieListUseCase.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//

protocol MovieListUseCase {
    func fetchMovieList(page: Int) async throws -> (
        MovieListResponse?,
        APIError
    )
}
