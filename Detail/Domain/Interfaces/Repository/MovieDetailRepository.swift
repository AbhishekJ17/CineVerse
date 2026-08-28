//
//  MovieDetailRepository.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//


protocol MovieDetailRepository {
    func fetchMovieDetail<T: Decodable>(fromId: Int32) async throws -> T?
}
