//
//  MovieListUseCase.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//

protocol MovieListUseCase {
    func fetchMovieList() async throws -> (MovieListResponse?, APIError)
}
