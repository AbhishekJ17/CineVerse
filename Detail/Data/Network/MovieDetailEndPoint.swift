//
//  MovieDetailEndPoint.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//
import Foundation

enum MovieDetailEndPoint: APIEndPoint {

    case detail(Int)

    var path: String {
        if case .detail(let id) = self {
            return "\(id)"
        }
        return ""
    }

    var method: HTTPMethod {
        .get
    }

    var queryItems: [URLQueryItem] {
        []
    }

    var headers: [String : String] {
        [:]
    }

    var body: [String : Any]? {
        nil
    }


}
