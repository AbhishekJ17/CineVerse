//
//  MovieListUseCase.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//

protocol MovieListUseCase {
    func fetchMovieListFor(category: MovieCategory, page: Int) async throws -> MovieListResponse?
}


