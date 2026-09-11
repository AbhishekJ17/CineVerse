//
//  PopularMovieEndPoint.swift
//  CineVerse
//
//  Created by Admin on 21/08/26.
//

import Foundation

enum MovieEndPoints: APIEndPoint {

    case topRated(page: Int)
    case upcoming(page: Int)
    case popular(page: Int)
    case nowPlaying(page: Int)
    case searchMovie(query: String, page: Int)

    var path: String {
        switch self {
            case .topRated(_): return "movie/top_rated"
            case .upcoming(_): return "movie/upcoming"
            case .popular(_): return "movie/popular"
            case .nowPlaying(_): return "movie/now_playing"
            case .searchMovie(_,_): return "search/movie"
        }
    }

    var method: HTTPMethod {
        .get
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .topRated(page: let page): return [URLQueryItem(name: "page", value: "\(page)")]
        case .upcoming(page: let page): return [URLQueryItem(name: "page", value: "\(page)")]
        case .popular(page: let page): return [URLQueryItem(name: "page", value: "\(page)")]
        case .nowPlaying(page: let page): return [URLQueryItem(name: "page", value: "\(page)")]
        case .searchMovie(query: let query, page: let page):
            return [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "query", value: query)
            ]
        }
    }

    var headers: [String: String] {
        return [:]
    }

    var body: [String : Any]? {
        return nil
    }
}
