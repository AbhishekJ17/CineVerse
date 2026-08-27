//
//  MovieListRepository.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//

protocol MovieListRepository {
    func fetchMovieList<T: Decodable>(endPoint: APIEndPoint) async throws -> T?
}
