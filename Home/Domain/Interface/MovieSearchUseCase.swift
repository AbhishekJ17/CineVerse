//
//  MovieSearchUseCase.swift
//  CineVerse
//
//  Created by Admin on 11/09/26.
//

protocol MovieSearchUseCase {
    func searchMovies(query: String, page: Int) async throws -> MovieListResponse?
}
