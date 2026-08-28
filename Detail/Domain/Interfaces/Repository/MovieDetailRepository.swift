//
//  MovieDetailRepository.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//


protocol MovieDetailRepository {
    func fetchMovieDetail(fromId: Int) async throws -> Movie?
}
