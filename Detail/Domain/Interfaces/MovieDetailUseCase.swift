//
//  MovieDetailUseCase.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//


protocol MovieDetailUseCase {
    func execute(movieId: Int) async throws -> Movie?
}
