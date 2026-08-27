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

    var name: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .popular: return "Popular"
        case .topRated: return "Top Rated"
        case .upcoming: return "Upcoming"
        }
    }
}

struct MovieSectionCategory {
    let category: MovieCategory
    let response: Result<MovieListResponse?, APIError>
}
