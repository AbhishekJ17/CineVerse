//
//  MovieSectionCategory.swift
//  CineVerse
//
//  Created by Admin on 27/08/26.
//

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
