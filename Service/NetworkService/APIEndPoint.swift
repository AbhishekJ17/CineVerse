//
//  APIEndPoint.swift
//  CineVerse
//
//  Created by Admin on 21/08/26.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case update = "UPDATE"
    case delete = "DELETE"
}

nonisolated protocol APIEndPoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    var headers: [String: String] { get }
    var body: [String: Any]? { get }
}
